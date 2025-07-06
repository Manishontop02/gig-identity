# Decentralized Identity for Gig Workers

## Project Purpose
This project provides a decentralized identity system for gig workers, built on Ethereum using a smart contract (`GigIdentity.sol`). It allows workers to create profiles, add work history, and store credentials on the blockchain. Employers can verify work history, ensuring trust and transparency in a decentralized manner. The system addresses the challenge of fragmented work records for gig workers by providing a verifiable, tamper-proof identity solution.

## Setup Instructions
1. **Install Dependencies**:
   - Install [Node.js](https://nodejs.org) (v16 or later).
   - Install [MetaMask](https://metamask.io) in your browser (e.g., Chrome).
   - Clone or navigate to the project folder:
     ```bash
     cd /path/to/gig-identity
     ```
   - Install project dependencies:
     ```bash
     npm install
     ```

2. **Run Hardhat Node**:
   - Start a local Ethereum blockchain:
     ```bash
     npx hardhat node
     ```
   - Note the test accounts (e.g., Worker: `0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266`, Employer: `0x70997970C51812dc3A010C7d01b50e0d17dc79C8`) and their private keys.

3. **Deploy the Smart Contract**:
   - Deploy the `GigIdentity` contract:
     ```bash
     npm run deploy
     ```
   - Copy the contract address (e.g., `0xNewAddressHere`).

4. **Update Frontend**:
   - Open `index.html` and update the `contractAddress` variable with the deployed contract address:
     ```javascript
     const contractAddress = "0xNewAddressHere";
     ```

5. **Run Local Server**:
   - Start the HTTP server:
     ```bash
     http-server
     ```
   - Access the app at `http://127.0.0.1:8080`.

6. **Configure MetaMask**:
   - Add the Hardhat network:
     - Network Name: Hardhat
     - RPC URL: `http://127.0.0.1:8545`
     - Chain ID: 31337
     - Currency Symbol: ETH
   - Import test accounts using private keys from the Hardhat node output.

## Usage
1. **Create Profile**:
   - Connect MetaMask with the worker’s account (e.g., `0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266`).
   - In the “Create Profile” section, enter a name and skills (comma-separated).
   - Click “Create Profile” and confirm in MetaMask.
   - View the profile under the “Profile” section.

2. **Add Work History**:
   - In the “Add Work History” section, enter job details and an employer address (e.g., `0x70997970C51812dc3A010C7d01b50e0d17dc79C8`).
   - Click “Add Work” and confirm.
   - View the work history under “Work History” (Verified: No).

3. **Verify Work History**:
   - Switch to the employer’s account in MetaMask (e.g., `0x70997970C51812dc3A010C7d01b50e0d17dc79C8`).
   - In the “Work History” section, enter the worker’s address (e.g., `0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266`) and click “Load Worker History”.
   - Click “Verify Work” for the relevant entry and confirm.
   - Verify the entry updates to “Verified: Yes”.

4. **Add Credential**:
   - In the “Add Credential” section, enter issuer, title, and description.
   - Click “Add Credential” and confirm.
   - View credentials under “Credentials”.

## Example Addresses
- **Worker**: `0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266`
- **Employer**: `0x70997970C51812dc3A010C7d01b50e0d17dc79C8`
