import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import model.Channel;
import model.User;
import model.Video;

public class Test {
    public static void main(String[] args) {
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("default");
        EntityManager em = factory.createEntityManager();

//        Channel channel = em.find(Channel.class, 1);
//        System.out.println("Название канала: " + channel.getName());
//        System.out.println("Автор: " + channel.getUser().getName());
//
//        for (Video video : channel.getVideos()) {
//            System.out.println(video.getId() + "." + video.getName() + " " + video.getCreatedAt());
//        }

        User user = em.find(User.class, 1);
        System.out.println("Пользователь: " + user.getName());
        System.out.println("Подписки: ");

        for (Channel channel : user.getSubscribedChannels()) {
            System.out.println(" - " + channel.getName() + " [" + channel.getVideos().size() + " videos]");
        }


        em.close();
        factory.close();
    }
}
