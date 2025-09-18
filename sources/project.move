module MyModule::BookClub {
    use std::string::String;
    use aptos_framework::signer;
    use aptos_framework::timestamp;

    /// Struct representing a book club member's reading progress
    struct MemberProgress has store, key {
        books_read: u64,         // Number of books completed
        current_book: String,    // Current book being read
        last_update: u64,        // Timestamp of last update
        is_active: bool          // Member's active status
    }

    /// Error codes
    const E_NOT_ACTIVE_MEMBER: u64 = 1;
    const E_ALREADY_MEMBER: u64 = 2;

    /// Function to join the book club and initialize member's progress
    public fun join_book_club(account: &signer, initial_book: String) {
        let addr = signer::address_of(account);
        
        // Check if member already exists
        assert!(!exists<MemberProgress>(addr), E_ALREADY_MEMBER);

        let member = MemberProgress {
            books_read: 0,
            current_book: initial_book,
            last_update: timestamp::now_seconds(),
            is_active: true
        };
        move_to(account, member);
    }

    /// Function to update reading progress and mark books as completed
    public fun update_progress(
        account: &signer, 
        new_book: String,
        completed: bool
    ) acquires MemberProgress {
        let addr = signer::address_of(account);
        let progress = borrow_global_mut<MemberProgress>(addr);
        
        // Check if member is active
        assert!(progress.is_active, E_NOT_ACTIVE_MEMBER);

        if (completed) {
            progress.books_read = progress.books_read + 1;
        };
        
        progress.current_book = new_book;
        progress.last_update = timestamp::now_seconds();
    }
}