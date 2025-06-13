# 🗳️ VotingApp - Smart Contract

A simple yet powerful Ethereum smart contract that enables decentralized voting. Users can vote only once for a valid candidate, and the contract determines the winner based on who gets the most votes. Built using Solidity `^0.8.19`.

---

## 🚀 Features

- 🧾 Add multiple candidates on deployment.
- ✅ One person, one vote (strictly enforced).
- 🔐 Validates candidate before accepting vote.
- 🧠 Automatically finds the current winner.
- ⚡ Gas-optimized with candidate mapping.
- 📦 Clean and minimal logic — perfect for learning or demo use.

---

## 🛠️ Tech Stack

| Layer          | Tool/Language        |
|----------------|----------------------|
| Smart Contract | Solidity `^0.8.19`   |
| Framework      | Remix or Hardhat     |
| Network        | Ethereum-compatible  |
| License        | MIT                  |

---

## 📦 Contract Overview

### ✅ Constructor

```solidity
constructor(string[] memory _candidates)
```

- Accepts an array of candidate names.
- Populates the candidate list and initializes their validity.

---

### 🗳️ vote(string _candidate)

```solidity
function vote(string memory _candidate) public onlyOnce
```

- Lets an address vote for a valid candidate **only once**.
- Emits a `Voted` event.
- Automatically increments the vote count.

---

### 🔎 getVotes(string _candidate)

```solidity
function getVotes(string memory _candidate) public view returns (uint)
```

- Returns the number of votes for a given candidate.

---

### 🏆 findWinner()

```solidity
function findWinner() public view returns (string memory)
```

- Scans all candidates and returns the one with the **most votes**.
- In case of a tie, returns the **first among equals**.

---

## 🔒 Access Control

- ❌ No admin or ownership needed.
- 🧍 Every wallet address gets only **one shot** at voting.

---

## 📋 Events

```solidity
event Voted(address indexed voter, string candidate);
```

- Emitted when a user successfully casts a vote.

---

## 📂 Example Deployment (Remix IDE)

1. Paste the contract in Remix.
2. Deploy with an array of candidates like:

   ```json
   ["Ram", "Shyaam", "Ramesh"]
   ```

3. Call `vote("Ram")` from different accounts.
4. Check votes with `getVotes("Ram")`.
5. Find the winner using `findWinner()`.

---

## 🔍 Sample Test Scenario

```txt
// Ram, Shyaam, and Ramesh are candidates.
// Three users vote: two for Ram, one for Shyaam.

-> vote("Ram") from Address 1 ✅
-> vote("Shyaam") from Address 2 ✅
-> vote("Ramesh") from Address 3 ✅
-> vote("Ram") again from Address 1 ❌ (rejected)

-> getVotes("Ram") => 2
-> getVotes("Shyaam") => 1
-> findWinner() => "Ram"
```

---

## 🧠 Future Enhancements

- ⏱️ Add a voting deadline.
- 🧑‍⚖️ Add admin control to close voting.
- 🤝 Tie handling with multiple winners.
- 🔐 Integrate with a frontend using Web3.js or Ethers.js.




