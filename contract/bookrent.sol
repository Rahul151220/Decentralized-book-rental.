// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DecentralizedBookRental {
    struct Book {
        uint id;
        string title;
        address owner;
        bool isRented;
    }

    mapping(uint => Book) public books;
    uint public bookCount;

    event BookAdded(uint id, string title, address owner);
    event BookRented(uint id, address renter);

    function addBook(string memory _title) public {
        bookCount++;
        books[bookCount] = Book(bookCount, _title, msg.sender, false);
        emit BookAdded(bookCount, _title, msg.sender);
    }

    function rentBook(uint _id) public {
        require(books[_id].id != 0, "Book does not exist");
        require(!books[_id].isRented, "Book is already rented");
        
        books[_id].isRented = true;
        emit BookRented(_id, msg.sender);
    }
}
