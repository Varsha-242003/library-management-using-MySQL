erDiagram

    MEMBERS {
        int member_id PK
        varchar name
        varchar email
        date join_date
        enum status
    }

    BOOKS {
        int book_id PK
        varchar title
        varchar isbn
        int total_copies
        int available_copies
    }

    AUTHORS {
        int author_id PK
        varchar author_name
    }

    BOOK_AUTHORS {
        int book_id FK
        int author_id FK
    }

    BOOK_ISSUES {
        int issue_id PK
        int book_id FK
        int member_id FK
        date issue_date
        date due_date
        date return_date
        decimal fine
    }

    RESERVATIONS {
        int reservation_id PK
        int book_id FK
        int member_id FK
        date reservation_date
        enum status
    }

    MEMBERS ||--o{ BOOK_ISSUES : borrows
    BOOKS ||--o{ BOOK_ISSUES : issued_in

    BOOKS ||--o{ BOOK_AUTHORS : has
    AUTHORS ||--o{ BOOK_AUTHORS : writes

    MEMBERS ||--o{ RESERVATIONS : makes
    BOOKS ||--o{ RESERVATIONS : reserved_for
