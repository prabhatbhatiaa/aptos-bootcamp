# Decentralized Book Club Tracker

A decentralized application (dApp) built on the Aptos blockchain that allows users to track and manage their book club participation.

## Overview

This smart contract enables users to join a decentralized book club and track their reading progress on the Aptos blockchain. Members can update their current reading status, mark books as completed, and maintain an on-chain record of their participation.

## Features

- Join the book club with an initial book selection
- Track number of books completed
- Update current reading progress
- Track member activity status
- Timestamp-based progress tracking

## Smart Contract Structure

The contract contains two main functions:

1. `join_book_club`: Allows users to join the book club and initialize their reading progress
2. `update_progress`: Enables members to update their current book and mark books as completed

## Getting Started

### Prerequisites

- [Aptos CLI](https://aptos.dev/cli-tools/aptos-cli-tool/install-aptos-cli)
- [Move Compiler](https://github.com/move-language/move)

### Installation

1. Clone the repository
```bash
git clone [your-repository-url]
cd web3_project
```

2. Compile the contract
```bash
aptos move compile
```

3. Test the contract
```bash
aptos move test
```

### Deployment

1. Configure your Aptos account
2. Deploy the contract:
```bash
aptos move publish
```

## Usage

### Joining the Book Club

To join the book club, call the `join_book_club` function with your initial book:

```move
public fun join_book_club(account: &signer, initial_book: String)
```

### Updating Progress

To update your reading progress:

```move
public fun update_progress(account: &signer, new_book: String, completed: bool)
```

## Technical Details

- Built on Aptos blockchain
- Written in Move language
- Uses Aptos framework for timestamp and signer verification

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.
