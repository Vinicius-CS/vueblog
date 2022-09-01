CREATE DATABASE IF NOT EXISTS `vueblog`;
USE `vueblog`;

CREATE TABLE IF NOT EXISTS `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `thumbnail` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `content` varchar(500) NOT NULL,
  `category` int(11) NOT NULL,
  `tags` varchar(255) NOT NULL,
  `publish` date NOT NULL,
  `author` int(11) NOT NULL,
  `status` enum('draft','published','trashed') NOT NULL DEFAULT 'draft',
  PRIMARY KEY (`id`),
  KEY `category` (`category`),
  KEY `author` (`author`)
);

INSERT INTO `article` (`id`, `title`, `thumbnail`, `description`, `content`, `category`, `tags`, `publish`, `author`, `status`) VALUES
(1, 'Lorem', 'https://mailrelay.com/wp-content/uploads/2017/06/crear-un-blog.png', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam tincidunt, justo ac imperdiet ullamcorper.', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam tincidunt, justo ac imperdiet ullamcorper, mi sapien blandit risus, a imperdiet odio libero non nibh. In mollis velit sed augue condimentum hendrerit. Donec vel efficitur elit. Pellentesque risus turpis, euismod a metus sit amet, posuere malesuada dui. Maecenas eleifend in ex eu viverra. Vestibulum imperdiet pretium elit. Nulla facilisi. Proin pharetra auctor convallis. In sit amet erat sed metus viverra tempus. Duis mollis molest', 1, '#Mundo', '2022-08-31', 2, 'published'),
(2, 'Ipsum', 'https://mailrelay.com/wp-content/uploads/2017/04/video-tutoriales-sobre-email-marketing.jpg', 'Mi sapien blandit risus, a imperdiet odio libero non nibh.', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam tincidunt, justo ac imperdiet ullamcorper, mi sapien blandit risus, a imperdiet odio libero non nibh. In mollis velit sed augue condimentum hendrerit. Donec vel efficitur elit. Pellentesque risus turpis, euismod a metus sit amet, posuere malesuada dui. Maecenas eleifend in ex eu viverra. Vestibulum imperdiet pretium elit. Nulla facilisi. Proin pharetra auctor convallis. In sit amet erat sed metus viverra tempus. Duis mollis molest', 1, '#Inovação #Tech', '2022-08-31', 2, 'published'),
(3, 'Dolor', 'https://webescuela.com/wp-content/uploads/2020/07/que-es-un-blog.png', 'In mollis velit sed augue condimentum hendrerit.', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam tincidunt, justo ac imperdiet ullamcorper, mi sapien blandit risus, a imperdiet odio libero non nibh. In mollis velit sed augue condimentum hendrerit. Donec vel efficitur elit. Pellentesque risus turpis, euismod a metus sit amet, posuere malesuada dui. Maecenas eleifend in ex eu viverra. Vestibulum imperdiet pretium elit. Nulla facilisi. Proin pharetra auctor convallis. In sit amet erat sed metus viverra tempus. Duis mollis molest', 2, '#Curiosos #Inovador', '2022-08-31', 3, 'published'),
(4, 'Sit Amet', 'https://webescuela.com/wp-content/uploads/2019/12/blog-corporativo.png', 'Donec vel efficitur elit. Pellentesque risus turpis, euismod a metus sit amet, posuere malesuada dui.', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam tincidunt, justo ac imperdiet ullamcorper, mi sapien blandit risus, a imperdiet odio libero non nibh. In mollis velit sed augue condimentum hendrerit. Donec vel efficitur elit. Pellentesque risus turpis, euismod a metus sit amet, posuere malesuada dui. Maecenas eleifend in ex eu viverra. Vestibulum imperdiet pretium elit. Nulla facilisi. Proin pharetra auctor convallis. In sit amet erat sed metus viverra tempus. Duis mollis molest', 3, '#Empreender', '2022-08-31', 2, 'published'),
(5, 'Consectetur', 'https://blogs.unsw.edu.au/nowideas/files/2017/06/blog-corporativo.jpg', 'Maecenas eleifend in ex eu viverra.', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam tincidunt, justo ac imperdiet ullamcorper, mi sapien blandit risus, a imperdiet odio libero non nibh. In mollis velit sed augue condimentum hendrerit. Donec vel efficitur elit. Pellentesque risus turpis, euismod a metus sit amet, posuere malesuada dui. Maecenas eleifend in ex eu viverra. Vestibulum imperdiet pretium elit. Nulla facilisi. Proin pharetra auctor convallis. In sit amet erat sed metus viverra tempus. Duis mollis molest', 1, 'tag3 tag4', '2022-08-31', 2, 'published'),
(6, 'Dolor', 'https://josefacchin.com/wp-content/uploads/2014/10/blog-corporativo-de-%C3%A9xito.png', 'Vestibulum imperdiet pretium elit. Nulla facilisi. Proin pharetra auctor convallis.', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam tincidunt, justo ac imperdiet ullamcorper, mi sapien blandit risus, a imperdiet odio libero non nibh. In mollis velit sed augue condimentum hendrerit. Donec vel efficitur elit. Pellentesque risus turpis, euismod a metus sit amet, posuere malesuada dui. Maecenas eleifend in ex eu viverra. Vestibulum imperdiet pretium elit. Nulla facilisi. Proin pharetra auctor convallis. In sit amet erat sed metus viverra tempus. Duis mollis molest', 4, '#Escola #EnsinoMédio', '2022-08-31', 2, 'published'),
(7, 'Adipiscing elit', 'https://lemon.digital/wp-content/uploads/2017/10/2-400x270.png', 'In sit amet erat sed metus viverra tempus.', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam tincidunt, justo ac imperdiet ullamcorper, mi sapien blandit risus, a imperdiet odio libero non nibh. In mollis velit sed augue condimentum hendrerit. Donec vel efficitur elit. Pellentesque risus turpis, euismod a metus sit amet, posuere malesuada dui. Maecenas eleifend in ex eu viverra. Vestibulum imperdiet pretium elit. Nulla facilisi. Proin pharetra auctor convallis. In sit amet erat sed metus viverra tempus. Duis mollis molest', 3, '#Startup #Negócios', '2022-08-31', 2, 'published'),
(8, 'Etiam', 'https://lemon.digital/wp-content/uploads/2017/10/1-400x270.png', 'Duis mollis molestie finibus.', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam tincidunt, justo ac imperdiet ullamcorper, mi sapien blandit risus, a imperdiet odio libero non nibh. In mollis velit sed augue condimentum hendrerit. Donec vel efficitur elit. Pellentesque risus turpis, euismod a metus sit amet, posuere malesuada dui. Maecenas eleifend in ex eu viverra. Vestibulum imperdiet pretium elit. Nulla facilisi. Proin pharetra auctor convallis. In sit amet erat sed metus viverra tempus. Duis mollis molest', 1, '#Internacional #EUA', '2022-08-31', 2, 'published'),
(9, 'Tincidunt', 'http://www.andaluciaesdigital.es/educarparaproteger/adolescentes/images/galeria/perfiles-tic/contenidos-blogs-fbk.jpg', 'Pellentesque mollis lorem non nisl imperdiet, id consequat augue finibus.', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam tincidunt, justo ac imperdiet ullamcorper, mi sapien blandit risus, a imperdiet odio libero non nibh. In mollis velit sed augue condimentum hendrerit. Donec vel efficitur elit. Pellentesque risus turpis, euismod a metus sit amet, posuere malesuada dui. Maecenas eleifend in ex eu viverra. Vestibulum imperdiet pretium elit. Nulla facilisi. Proin pharetra auctor convallis. In sit amet erat sed metus viverra tempus. Duis mollis molest', 2, '#Diferente #Novo', '2022-08-31', 3, 'published'),
(10, 'Justo Ac Imperdiet', 'https://www.salesforce.com/content/dam/blogs/ca/Blog%20Posts/anatomy-of-a-blog-post-deconstructed-open-graph.jpg', 'Nulla tortor massa, congue semper euismod sed, condimentum eu nibh.', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam tincidunt, justo ac imperdiet ullamcorper, mi sapien blandit risus, a imperdiet odio libero non nibh. In mollis velit sed augue condimentum hendrerit. Donec vel efficitur elit. Pellentesque risus turpis, euismod a metus sit amet, posuere malesuada dui. Maecenas eleifend in ex eu viverra. Vestibulum imperdiet pretium elit. Nulla facilisi. Proin pharetra auctor convallis. In sit amet erat sed metus viverra tempus. Duis mollis molest', 3, '#Mercado', '2022-08-31', 2, 'published'),
(11, 'Ullamcorper', 'https://www.blogtyrant.com/wp-content/uploads/2019/07/draft-a-post.jpg', 'Curabitur ac odio diam.', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam tincidunt, justo ac imperdiet ullamcorper, mi sapien blandit risus, a imperdiet odio libero non nibh. In mollis velit sed augue condimentum hendrerit. Donec vel efficitur elit. Pellentesque risus turpis, euismod a metus sit amet, posuere malesuada dui. Maecenas eleifend in ex eu viverra. Vestibulum imperdiet pretium elit. Nulla facilisi. Proin pharetra auctor convallis. In sit amet erat sed metus viverra tempus. Duis mollis molest', 3, '#Lançamento', '2022-08-31', 2, 'published'),
(12, 'Dolor', 'https://contenthub-static.grammarly.com/blog/wp-content/uploads/2017/11/how-to-write-a-blog-post.jpeg', 'Suspendisse facilisis orci quis tortor viverra, accumsan commodo sapien cursus.', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam tincidunt, justo ac imperdiet ullamcorper, mi sapien blandit risus, a imperdiet odio libero non nibh. In mollis velit sed augue condimentum hendrerit. Donec vel efficitur elit. Pellentesque risus turpis, euismod a metus sit amet, posuere malesuada dui. Maecenas eleifend in ex eu viverra. Vestibulum imperdiet pretium elit. Nulla facilisi. Proin pharetra auctor convallis. In sit amet erat sed metus viverra tempus. Duis mollis molest', 3, '#Falência', '2022-08-31', 2, 'published'),
(13, 'Mi Sapien Blandit', 'https://www.elegantthemes.com/blog/wp-content/uploads/2019/08/things-successful-blogs-have-in-common-featured-image.jpg', 'Curabitur nunc nunc, faucibus ac faucibus sed, faucibus at nulla.', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam tincidunt, justo ac imperdiet ullamcorper, mi sapien blandit risus, a imperdiet odio libero non nibh. In mollis velit sed augue condimentum hendrerit. Donec vel efficitur elit. Pellentesque risus turpis, euismod a metus sit amet, posuere malesuada dui. Maecenas eleifend in ex eu viverra. Vestibulum imperdiet pretium elit. Nulla facilisi. Proin pharetra auctor convallis. In sit amet erat sed metus viverra tempus. Duis mollis molest', 2, '#Celular #Computador', '2022-08-31', 3, 'published'),
(14, 'Imperdiet Odio', 'https://www.hostinger.com/tutorials/wp-content/uploads/sites/2/2022/03/what-is-a-blog.png', 'Vivamus metus felis, feugiat quis tortor vitae, pellentesque mattis mauris.', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam tincidunt, justo ac imperdiet ullamcorper, mi sapien blandit risus, a imperdiet odio libero non nibh. In mollis velit sed augue condimentum hendrerit. Donec vel efficitur elit. Pellentesque risus turpis, euismod a metus sit amet, posuere malesuada dui. Maecenas eleifend in ex eu viverra. Vestibulum imperdiet pretium elit. Nulla facilisi. Proin pharetra auctor convallis. In sit amet erat sed metus viverra tempus. Duis mollis molest', 4, '#Informação #Sabedoria', '2022-08-31', 2, 'published'),
(15, 'Libero Non Nibh', 'https://elblogger.net/wp-content/uploads/2021/07/blog.png', 'Praesent viverra urna sit amet dui bibendum volutpat.', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam tincidunt, justo ac imperdiet ullamcorper, mi sapien blandit risus, a imperdiet odio libero non nibh. In mollis velit sed augue condimentum hendrerit. Donec vel efficitur elit. Pellentesque risus turpis, euismod a metus sit amet, posuere malesuada dui. Maecenas eleifend in ex eu viverra. Vestibulum imperdiet pretium elit. Nulla facilisi. Proin pharetra auctor convallis. In sit amet erat sed metus viverra tempus. Duis mollis molest', 1, '#Curiosidade', '2022-08-31', 2, 'published'),
(16, 'In Mollis', 'https://pysnnoticias.com/wp-content/uploads/2021/09/crear-un-blog.png', 'Curabitur sit amet vulputate urna.', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam tincidunt, justo ac imperdiet ullamcorper, mi sapien blandit risus, a imperdiet odio libero non nibh. In mollis velit sed augue condimentum hendrerit. Donec vel efficitur elit. Pellentesque risus turpis, euismod a metus sit amet, posuere malesuada dui. Maecenas eleifend in ex eu viverra. Vestibulum imperdiet pretium elit. Nulla facilisi. Proin pharetra auctor convallis. In sit amet erat sed metus viverra tempus. Duis mollis molest', 3, '#Mundo #Japão', '2022-08-31', 2, 'draft'),
(17, 'Velit Sed', 'https://www.elegantthemes.com/blog/wp-content/uploads/2018/11/shutterstock_1049564585-960.jpg', 'Ut aliquam vestibulum diam sed vestibulum.', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam tincidunt, justo ac imperdiet ullamcorper, mi sapien blandit risus, a imperdiet odio libero non nibh. In mollis velit sed augue condimentum hendrerit. Donec vel efficitur elit. Pellentesque risus turpis, euismod a metus sit amet, posuere malesuada dui. Maecenas eleifend in ex eu viverra. Vestibulum imperdiet pretium elit. Nulla facilisi. Proin pharetra auctor convallis. In sit amet erat sed metus viverra tempus. Duis mollis molest', 1, '#Sistemas', '2022-08-31', 2, 'draft'),
(18, 'Augue Condimentum', 'https://webescuela.com/wp-content/uploads/2020/07/que-es-un-blog.png', 'Nam sed elit lobortis, ullamcorper mi quis, dictum nisl.', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam tincidunt, justo ac imperdiet ullamcorper, mi sapien blandit risus, a imperdiet odio libero non nibh. In mollis velit sed augue condimentum hendrerit. Donec vel efficitur elit. Pellentesque risus turpis, euismod a metus sit amet, posuere malesuada dui. Maecenas eleifend in ex eu viverra. Vestibulum imperdiet pretium elit. Nulla facilisi. Proin pharetra auctor convallis. In sit amet erat sed metus viverra tempus. Duis mollis molest', 2, '#Tecnol[ogico', '2022-08-31', 2, 'trashed');

CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
);

INSERT INTO `category` (`id`, `name`, `description`) VALUES
(1, 'Geral', 'Categoria com todos os artigos.'),
(2, 'Tecnologia', 'Categoria de tecnologia.'),
(3, 'Empresas', 'Categoria de inovação.'),
(4, 'Educação', 'Categoria de educação.');

CREATE TABLE IF NOT EXISTS `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) NOT NULL,
  `publish` date NOT NULL,
  `article` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `article` (`article`),
  KEY `user` (`user`)
);

CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `role` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `role` (`role`)
);

CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
);

INSERT INTO `roles` (`id`, `name`, `description`) VALUES
(1, 'Leitor', 'Todos os leitores do blog.'),
(2, 'Moderador', 'Responsável por apagar comentários que não cumpram as regras.'),
(3, 'Editor', 'Responsável por publicar novos artigos.'),
(4, 'Supervisor', 'Responsável por verificar erros de ortografia nos artigos.'),
(5, 'Administrador', 'Responsável pelo blog.');

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `role` (`role`)
);

INSERT INTO `users` (`id`, `name`, `last_name`, `email`, `password`, `role`) VALUES
(1, 'Vinicius', 'Silva', 'administrador@blog.com', MD5('administrador'), 5),
(2, 'João', 'Maria', 'supervisor@blog.com', MD5('supervisor'), 4),
(3, 'Fernanda', 'Moreira', 'editor@blog.com', MD5('editor'), 3),
(4, 'Anna', 'Beatriz', 'moderador@blog.com', MD5('moderador'), 2),
(5, 'Hugo', 'Braian', 'usuario@blog.com', MD5('usuario'), 1);

ALTER TABLE `article`
  ADD CONSTRAINT `article_ibfk_1` FOREIGN KEY (`category`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `article_ibfk_2` FOREIGN KEY (`author`) REFERENCES `users` (`id`);

ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`article`) REFERENCES `article` (`id`),
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`user`) REFERENCES `users` (`id`);

ALTER TABLE `permissions`
  ADD CONSTRAINT `permissions_ibfk_1` FOREIGN KEY (`role`) REFERENCES `roles` (`id`);

ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role`) REFERENCES `roles` (`id`);
COMMIT;
