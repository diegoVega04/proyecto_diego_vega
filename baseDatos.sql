CREATE SCHEMA IF NOT EXISTS `gestorLibros` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `gestorLibros`;

CREATE TABLE `libros` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `nombre` VARCHAR(255) NOT NULL,
    `publicacion` DATE NOT NULL,
    `genero` VARCHAR(255),
    `descripcion` TEXT
);

CREATE TABLE `usuarios` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `nombre_usuario` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL
);

CREATE TABLE `libros_usuario` (
    `id_usuario` INT NOT NULL,
    `id_libro` INT NOT NULL,
    `nota` INT NOT NULL CHECK (`nota` BETWEEN 1 AND 10),
    `opinion` TEXT NOT NULL,
    PRIMARY KEY (`id_usuario`, `id_libro`),
    FOREIGN KEY (`id_usuario`) REFERENCES `usuarios`(`id`),
    FOREIGN KEY (`id_libro`) REFERENCES `libros`(`id`)
);

-- Insertar usuarios
INSERT INTO `usuarios` (`nombre_usuario`, `password`) VALUES
('user1', '1234'),
('user2', '4321'),
('user3', 'pass');

-- Insertar libros
INSERT INTO `libros` (`nombre`, `publicacion`, `genero`, `descripcion`) VALUES
('1984', '1949-06-08', 'Distopía', 'Una novela que explora un mundo distópico controlado por el Gran Hermano.'),
('Cien años de soledad', '1967-05-30', 'Realismo Mágico', 'Una obra maestra de Gabriel García Márquez que narra la historia de la familia Buendía.'),
('El principito', '1943-04-06', 'Fábula', 'Un pequeño príncipe viaja por el universo descubriendo el valor de la amistad y el amor.'),
('To Kill a Mockingbird', '1960-07-11', 'Ficción', 'Una historia sobre justicia y prejuicio en el sur de Estados Unidos.');

-- Insertar relación libros-usuarios
INSERT INTO `libros_usuario` (`id_usuario`, `id_libro`, `nota`, `opinion`) VALUES
(1, 1, 9, 'Una lectura fascinante y aterradora, muy recomendable.'),
(1, 2, 8, 'Me gustó mucho la profundidad de los personajes.'),
(2, 3, 10, 'Un libro hermoso y conmovedor, lleno de enseñanzas.'),
(3, 4, 7, 'Interesante, pero un poco lento en algunos capítulos.');
