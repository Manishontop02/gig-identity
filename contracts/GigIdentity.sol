
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GigIdentity {
    struct Profile {
        string name;
        string[] skills;
    }

    struct WorkHistory {
        string jobTitle;
        string description;
        string startDate;
        string endDate;
        address employer;
        bool verified;
    }

    struct Credential {
        string issuer;
        string title;
        string description;
    }

    mapping(address => Profile) public profiles;
    mapping(address => WorkHistory[]) public workHistories;
    mapping(address => Credential[]) public credentials;

    function createProfile(string memory _name, string[] memory _skills) public {
        require(bytes(_name).length > 0, "Name cannot be empty");
        profiles[msg.sender] = Profile(_name, _skills);
    }

    function addWorkHistory(
        string memory _jobTitle,
        string memory _description,
        string memory _startDate,
        string memory _endDate,
        address _employer
    ) public {
        require(bytes(_jobTitle).length > 0, "Job title cannot be empty");
        require(bytes(_description).length > 0, "Description cannot be empty");
        require(bytes(_startDate).length > 0, "Start date cannot be empty");
        require(bytes(_endDate).length > 0, "End date cannot be empty");
        require(_employer != address(0), "Employer address cannot be zero");
        workHistories[msg.sender].push(
            WorkHistory(_jobTitle, _description, _startDate, _endDate, _employer, false)
        );
    }

    function addCredential(
        string memory _issuer,
        string memory _title,
        string memory _description
    ) public {
        require(bytes(_issuer).length > 0, "Issuer cannot be empty");
        require(bytes(_title).length > 0, "Title cannot be empty");
        require(bytes(_description).length > 0, "Description cannot be empty");
        credentials[msg.sender].push(Credential(_issuer, _title, _description));
    }

    function verifyWork(address _worker, uint256 _index) public {
        require(_index < workHistories[_worker].length, "Invalid work history index");
        require(msg.sender == workHistories[_worker][_index].employer, "Only employer can verify");
        workHistories[_worker][_index].verified = true;
    }

    function getProfile(address _user) public view returns (Profile memory) {
        return profiles[_user];
    }

    function getWorkHistory(address _user, uint256 _index) public view returns (WorkHistory memory) {
        require(_index < workHistories[_user].length, "Invalid work history index");
        return workHistories[_user][_index];
    }

    function getWorkHistoryCount(address _user) public view returns (uint256) {
        return workHistories[_user].length;
    }

    function getCredential(address _user, uint256 _index) public view returns (Credential memory) {
        require(_index < credentials[_user].length, "Invalid credential index");
        return credentials[_user][_index];
    }

    function getCredentialCount(address _user) public view returns (uint256) {
        return credentials[_user].length;
    }
}