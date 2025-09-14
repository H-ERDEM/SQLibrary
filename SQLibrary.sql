CREATE TABLE books(
    book_id INT PRIMARY KEY, -- otomatik artsın dersen IDENTITY(1,1) ekle
    title NVARCHAR(255) NOT NULL,
    author NVARCHAR(255) NOT NULL,
    genre NVARCHAR(50),
    price DECIMAL(10,2) CHECK(price > 0),
    stock_qublished INT CHECK(stock_qublished >= 0),
    published_year INT CHECK(published_year BETWEEN 1800 AND 2025), -- 1829 için genişlettim
    added_at DATE
);

INSERT INTO books (book_id, title, author, genre, price, stock_qublished, published_year, added_at) VALUES
(1, N'Kayıp Zamanın İzinde', N'M. Proust', N'roman', 129.90, 25, 1913, '2025-08-20'),
(2, N'Simyacı', N'P. Coelho', N'roman', 89.50, 40, 1988, '2025-08-21'),
(3, N'Sapiens', N'Y. N. Harari', N'tarih', 159.00, 18, 2011, '2025-08-25'),
(4, N'İnce Memed', N'Y. Kemal', N'roman', 99.90, 12, 1955, '2025-08-22'),
(5, N'Körlük', N'J. Saramago', N'roman', 119.00, 7, 1995, '2025-08-28'),
(6, N'Dune', N'F. Herbert', N'bilim', 149.00, 30, 1965, '2025-09-01'),
(7, N'Hayvan Çiftliği', N'G. Orwell', N'roman', 79.90, 55, 1945, '2025-08-23'),
(8, N'1984', N'G. Orwell', N'roman', 99.00, 35, 1949, '2025-08-24'),
(9, N'Nutuk', N'M. K. Atatürk', N'tarih', 139.00, 20, 1927, '2025-08-27'),
(10, N'Küçük Prens', N'A. de Saint-Exupéry', N'çocuk', 69.90, 80, 1943, '2025-08-26'),
(11, N'Başlangıç', N'D. Brown', N'roman', 109.00, 22, 2017, '2025-09-02'),
(12, N'Atomik Alışkanlıklar', N'J. Clear', N'kişisel gelişim', 129.00, 28, 2018, '2025-09-03'),
(13, N'Zamanın Kısa Tarihi', N'S. Hawking', N'bilim', 119.50, 16, 1988, '2025-08-29'),
(14, N'Şeker Portakalı', N'J. M. de Vasconcelos', N'roman', 84.90, 45, 1968, '2025-08-30'),
(15, N'Bir İdam Mahkûmunun Son Günü', N'V. Hugo', N'roman', 74.90, 26, 1829, '2025-08-31');

-- Sorgu 1 
SELECT title, author, price FROM books ORDER BY price ASC;
-- Sorgu 2 
SELECT * FROM books WHERE genre = N'roman' ORDER BY title ASC;
-- Sorgu 3 
SELECT * FROM books WHERE price BETWEEN 80 AND 120;
-- Sorgu 4 
SELECT title, stock_qublished FROM books WHERE stock_qublished < 20;
-- Sorgu 5 
SELECT * FROM books WHERE title COLLATE SQL_Latin1_General_CP1_CI_AI LIKE N'%zaman%';
-- Sorgu 6
SELECT * FROM books WHERE genre IN (N'roman', N'bilim');
-- Sorgu 7 
SELECT * FROM books WHERE published_year >= 2000 ORDER BY published_year DESC;
-- Sorgu 8 
SELECT * FROM books WHERE added_at >= CAST(DATEADD(DAY, -10, GETDATE()) AS DATE);
-- Sorgu 9 
SELECT TOP 5 * FROM books ORDER BY price DESC;
-- Sorgu 10 
SELECT * FROM books WHERE stock_qublished BETWEEN 30 AND 60 ORDER BY price ASC;
