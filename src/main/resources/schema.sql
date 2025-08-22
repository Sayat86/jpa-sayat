create table users
(
    id         bigserial primary key,
    name       varchar(100) not null,
    email      varchar(50)  not null unique,
    created_at timestamp    not null
);

create table channels
(
    id          bigserial primary key,
    name        varchar(255)  not null,
    description varchar(1000) not null,
    country     varchar(50)   not null,
    created_at  timestamp     not null,
    user_id     bigint        not null unique ,
    foreign key (user_id) references users (id)
);

create table videos
(
    id          bigserial primary key,
    name        varchar(255)  not null,
    description varchar(1000) not null,
    created_at  timestamp     not null,
    is_hidden   boolean       not null,
    views       int           not null,
    channel_id  bigint        not null,
    foreign key (channel_id) references channels (id)
);

create table subscriptions
(
    user_id    bigint references users (id),
    channel_id bigint references channels (id),
    primary key (user_id, channel_id)
);

create table views
(
    id         bigserial primary key,
    user_id    bigint references users (id),
    video_id   bigint references videos (id),
    created_at timestamp not null,
    updated_at timestamp not null
);

insert into users (name, email, created_at)
values ('Alice Johnson', 'alice@example.com', '2025-01-10 12:34:00'),
       ('Bob Smith', 'bob@example.com', '2025-01-11 09:20:00'),
       ('Charlie Brown', 'charlie@example.com', '2025-01-12 17:45:00'),
       ('Diana Prince', 'diana@example.com', '2025-01-13 11:10:00'),
       ('Ethan Clark', 'ethan@example.com', '2025-01-14 19:30:00'),
       ('Fiona Davis', 'fiona@example.com', '2025-01-15 10:15:00'),
       ('George Miller', 'george@example.com', '2025-01-16 13:40:00'),
       ('Hannah Wilson', 'hannah@example.com', '2025-01-17 18:25:00'),
       ('Ian Wright', 'ian@example.com', '2025-01-18 14:55:00'),
       ('Julia Roberts', 'julia@example.com', '2025-01-19 16:20:00'),
       ('Kevin Lee', 'kevin@example.com', '2025-01-20 20:30:00'),
       ('Laura Scott', 'laura@example.com', '2025-01-21 09:10:00'),
       ('Michael Young', 'michael@example.com', '2025-01-22 15:45:00'),
       ('Nina Turner', 'nina@example.com', '2025-01-23 17:05:00'),
       ('Oscar King', 'oscar@example.com', '2025-01-24 19:50:00'),
       ('Paula Adams', 'paula@example.com', '2025-01-25 12:40:00'),
       ('Quentin Baker', 'quentin@example.com', '2025-01-26 14:10:00'),
       ('Rachel Green', 'rachel@example.com', '2025-01-27 18:20:00'),
       ('Sam Carter', 'sam@example.com', '2025-01-28 20:15:00'),
       ('Tina Lopez', 'tina@example.com', '2025-01-29 21:30:00');

insert into channels (name, description, country, created_at, user_id)
values ('Alice Vlogs', 'Travel and daily life vlogs.', 'USA', '2025-01-12 10:00:00', 1),
       ('Bob Gaming', 'Gameplay videos, tips and tricks.', 'USA', '2025-01-13 15:30:00', 2),
       ('Charlie Music', 'Covers and original songs.', 'USA', '2025-01-14 20:00:00', 3),
       ('Diana Fitness', 'Workout routines and health tips.', 'USA', '2025-01-15 09:45:00', 4),
       ('Ethan Tech', 'Tech reviews and coding tutorials.', 'KAZAKHSTAN', '2025-01-16 18:20:00', 5),
       ('Fiona Cooking', 'Home recipes and cooking hacks.', 'USA', '2025-01-17 11:40:00', 6),
       ('George Travel', 'Exploring new countries.', 'KAZAKHSTAN', '2025-01-18 08:30:00', 7),
       ('Hannah Art', 'Drawing, painting and digital art.', 'RUSSIA', '2025-01-19 14:00:00', 8),
       ('Ian Movies', 'Movie reviews and reactions.', 'RUSSIA', '2025-01-20 20:10:00', 9),
       ('Julia Fashion', 'Style tips and clothing hauls.', 'KAZAKHSTAN', '2025-01-21 16:00:00', 10),
       ('Kevin Science', 'Experiments and fun facts.', 'USA', '2025-01-22 18:40:00', 11),
       ('Laura Books', 'Book reviews and recommendations.', 'UK', '2025-01-23 09:30:00', 12),
       ('Michael Cars', 'Car reviews and test drives.', 'KAZAKHSTAN', '2025-01-24 19:00:00', 13),
       ('Nina Dance', 'Dance tutorials and performances.', 'RUSSIA', '2025-01-25 12:10:00', 14),
       ('Oscar Comedy', 'Funny sketches and parodies.', 'RUSSIA', '2025-01-26 21:20:00', 15),
       ('Paula Nature', 'Wildlife and nature exploration.', 'CHINA', '2025-01-27 10:15:00', 16),
       ('Quentin History', 'History documentaries.', 'CHINA', '2025-01-28 14:30:00', 17),
       ('Rachel DIY', 'Crafts and do-it-yourself projects.', 'CHINA', '2025-01-29 17:25:00', 18),
       ('Sam Sports', 'Football highlights and analysis.', 'CHINA', '2025-01-30 15:50:00', 19),
       ('Tina Beauty', 'Makeup tutorials and skincare.', 'USA', '2025-01-31 20:30:00', 20);

insert into videos (name, description, created_at, is_hidden, views, channel_id)
values ('Trip to Paris', 'My journey to Paris.', '2025-01-15 08:00:00', false, 1200, 1),
       ('Morning Routine', 'How I start my mornings.', '2025-01-20 09:00:00', false, 800, 1),

       ('Minecraft LetsPlay #1', 'Starting my Minecraft world.', '2025-01-16 14:00:00', false, 3000, 2),
       ('Top 10 Gaming Tips', 'Tips for becoming a better gamer.', '2025-01-18 16:00:00', false, 2200, 2),
       ('Funny Moments Compilation', 'Funniest gaming fails.', '2025-01-21 18:00:00', false, 4000, 2),

       ('Guitar Cover - Beatles', 'My cover of a Beatles song.', '2025-01-22 19:00:00', false, 1500, 3),
       ('Original Song - Dreaming', 'My first original song.', '2025-01-23 21:00:00', true, 400, 3),

       ('Full Body Workout', '30 min intense workout.', '2025-01-24 08:30:00', false, 900, 4),
       ('Healthy Meal Prep', 'Easy and healthy meal ideas.', '2025-01-25 12:00:00', false, 750, 4),

       ('iPhone 15 Review', 'Testing the new iPhone.', '2025-01-26 10:00:00', false, 1800, 5),
       ('Java Tutorial #1', 'Intro to Java programming.', '2025-01-27 15:00:00', false, 1100, 5),

       ('Pasta Recipe', 'Easy homemade pasta.', '2025-01-28 11:00:00', false, 950, 6),
       ('Quick Dessert', 'Fast and tasty dessert recipe.', '2025-01-29 17:00:00', false, 870, 6),

       ('Trip to Tokyo', 'Exploring Japan.', '2025-01-30 09:00:00', false, 1300, 7),
       ('Best Cities in Europe', 'Top cities you should visit.', '2025-02-01 19:00:00', false, 2200, 7),

       ('Digital Portrait', 'Drawing a portrait in Procreate.', '2025-02-02 20:00:00', false, 600, 8),
       ('Watercolor Basics', 'Beginner watercolor tutorial.', '2025-02-03 14:00:00', false, 720, 8),

       ('Movie Review - Inception', 'My thoughts on Inception.', '2025-02-04 18:00:00', false, 2000, 9),
       ('Top 5 Movies 2024', 'Best movies of the year.', '2025-02-05 21:00:00', false, 1750, 9),

       ('Summer Fashion Haul', 'My new outfits.', '2025-02-06 15:00:00', false, 900, 10),
       ('Winter Style Tips', 'How to dress in winter.', '2025-02-07 11:00:00', false, 850, 10),

       ('Cool Science Experiments', 'Fun experiments at home.', '2025-02-08 13:00:00', false, 1400, 11),
       ('Why Sky is Blue?', 'Explaining the science.', '2025-02-09 10:00:00', false, 1000, 11),

       ('Best Books of 2024', 'My top 5 books.', '2025-02-10 19:00:00', false, 800, 12),
       ('Book vs Movie', 'Comparing book and film.', '2025-02-11 20:00:00', false, 750, 12),

       ('Tesla Model S Review', 'Full car review.', '2025-02-12 17:00:00', false, 1600, 13),
       ('Tokyo Drift Experience', 'Testing sports cars.', '2025-02-13 12:00:00', false, 2100, 13),

       ('Dance Challenge', 'New trending dance.', '2025-02-14 14:00:00', false, 1250, 14),
       ('Samba Tutorial', 'Learn samba basics.', '2025-02-15 09:00:00', false, 980, 14),

       ('Funny Pranks', 'Trying pranks with friends.', '2025-02-16 20:00:00', false, 2500, 15),
       ('Comedy Sketch #1', 'Short comedy skit.', '2025-02-17 21:00:00', false, 1900, 15),

       ('Amazon Rainforest', 'Exploring the jungle.', '2025-02-18 11:00:00', false, 1100, 16),
       ('Wildlife Documentary', 'Animals in their habitat.', '2025-02-19 18:00:00', false, 1200, 16),

       ('WWII Documentary', 'Stories from WWII.', '2025-02-20 19:00:00', false, 1700, 17),
       ('Ancient Egypt', 'Exploring pyramids.', '2025-02-21 14:00:00', false, 1600, 17),

       ('DIY Home Decor', 'Easy decoration projects.', '2025-02-22 13:00:00', false, 900, 18),
       ('DIY Gifts', 'Creative handmade gifts.', '2025-02-23 09:00:00', false, 850, 18),

       ('Football Highlights', 'Best moments of the week.', '2025-02-24 20:00:00', false, 2000, 19),
       ('Match Analysis', 'Breaking down the game.', '2025-02-25 15:00:00', false, 1700, 19),

       ('Makeup Tutorial', 'Everyday makeup look.', '2025-02-26 10:00:00', false, 950, 20),
       ('Skincare Routine', 'Best products for skin.', '2025-02-27 21:00:00', false, 880, 20);

insert into subscriptions (user_id, channel_id)
values (1, 2),
       (1, 5),
       (1, 7),
       (2, 1),
       (2, 3),
       (2, 6),
       (3, 4),
       (3, 5),
       (3, 10),
       (4, 8),
       (4, 9),
       (5, 1),
       (5, 3),
       (5, 12),
       (6, 7),
       (6, 15),
       (7, 2),
       (7, 14),
       (8, 13),
       (8, 20),
       (9, 16),
       (9, 18),
       (10, 19),
       (10, 4),
       (11, 17),
       (11, 6),
       (12, 5),
       (12, 8),
       (13, 3),
       (13, 1),
       (14, 2),
       (14, 9),
       (15, 10),
       (15, 12),
       (16, 20),
       (16, 11),
       (17, 15),
       (17, 7),
       (18, 13),
       (18, 19),
       (19, 6),
       (19, 14),
       (20, 1),
       (20, 16);

insert into views (user_id, video_id, created_at, updated_at)
values (1, 3, '2025-01-16 12:00:00', '2025-01-16 12:05:00'),
       (2, 1, '2025-01-15 10:00:00', '2025-01-15 10:02:00'),
       (2, 7, '2025-01-22 13:00:00', '2025-01-22 13:04:00'),
       (3, 9, '2025-01-24 09:00:00', '2025-01-24 09:30:00'),
       (4, 11, '2025-01-26 11:00:00', '2025-01-26 11:10:00'),
       (5, 14, '2025-01-29 14:00:00', '2025-01-29 14:03:00'),
       (6, 18, '2025-02-04 20:00:00', '2025-02-04 20:07:00'),
       (7, 22, '2025-02-06 15:00:00', '2025-02-06 15:05:00'),
       (8, 26, '2025-02-08 19:00:00', '2025-02-08 19:06:00'),
       (9, 30, '2025-02-12 12:00:00', '2025-02-12 12:10:00'),
       (10, 35, '2025-02-14 13:00:00', '2025-02-14 13:10:00'),
       (11, 40, '2025-02-17 16:00:00', '2025-02-17 16:05:00');