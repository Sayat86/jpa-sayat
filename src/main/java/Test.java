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

//        User user = em.find(User.class, 1);
//        System.out.println("Пользователь: " + user.getName());
//        System.out.println("Подписки: ");
//
//        for (Channel channel : user.getSubscribedChannels()) {
//            System.out.println(" - " + channel.getName() + " [" + channel.getVideos().size() + " videos]");
//        }

//        Video video = em.find(Video.class, 1);
//        System.out.println("Видео: " + video.getName());
//        System.out.println("Опубликовано: " + video.getCreatedAt());
//        System.out.println("Канал: " + video.getChannel().getName());
//        System.out.println("Просмотры: " + video.getViews());
//        System.out.println("Количество унмкальных просмотров: " + video.getId());
//
//        Channel channel = em.find(Channel.class, 1);
//        System.out.println("Канал: " + channel.getName());
//        System.out.println("Страна: " + channel.getCountry());
//        System.out.println("Владелец канала: " + channel.getUser().getName());
//        System.out.println("Дата создания: " + channel.getCreatedAt());
//        System.out.println("Видео:");
//        for (Video video : channel.getVideos()) {
//            System.out.println(video.getId() + "." + video.getName() + " [" + video.getViews() + " views]");
//        }

        User user = em.find(User.class, 1);
        System.out.println("Пользователь: " + user.getName());
        System.out.println("Подписки:");
        for (Channel channel : user.getSubscribedChannels()) {
            System.out.println(" - " + channel.getName());
            for (Video video : channel.getVideos()) {
                System.out.println("     " + video.getId() + ". " + video.getName() + " [" + video.getViews() + " views]");
            }
        }


        em.close();
        factory.close();
    }
}
