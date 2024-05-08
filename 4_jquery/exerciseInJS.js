const books = [
    { title: "The Great Gatsby", author: "F. Scott Fitzgerald", pages: 180, year: 1925, isbn: "9780743273565" },
    { title: "To Kill a Mockingbird", author: "Harper Lee", pages: 281, year: 1960, isbn: "9780061120084" },
    { title: "1984", author: "George Orwell", pages: 328, year: 1949, isbn: "9780451524935" }
  ];
  console.log(getInventory(books));
  
  
  function getInventory(books) {
    const totalBooks = books.length;
  
    const totalPages = books.reduce((total, book) => total + book.pages, 0);
  
    const authors = books.map(book => book.author);
  
    const oldestBook = books.reduce((oldest, book) => book.year < oldest.year ? book : oldest);
  
    const newestBook = books.reduce((newest, book) => book.year > newest.year ? book : newest);
  
    return {
      totalBooks: totalBooks,
      totalPages: totalPages,
      authors: authors,
      oldestBook: oldestBook,
      newestBook: newestBook
    };
  }
  
  console.log(getInventory(books));