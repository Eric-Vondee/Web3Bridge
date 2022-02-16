// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract Passport {

    address private owner;
    constructor() {
        owner = msg.sender;
    }

    enum licenseStatus {
        Pending,
        Shipped,
        Accepted,
        Rejected,
        Canceled
    }
    struct User {
        string name; 
        uint8 age;
        string country;
        uint8 license;
        licenseStatus status;
        uint256 balance;
    }

    struct Country{
        string name;
        uint256 balance;
    }
    mapping(address => User) public passports;
    mapping(string => Country) public countryVault;

    //modifier
    modifier adminValidation() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    function setPassport(address _address, string memory _name, uint8 _age, string memory _country, uint8 _license, uint256 _balance) public {
        passports[_address] = User(_name, _age, _country, _license, licenseStatus.Pending, _balance);
    }

    //update passport license and status
    function updatePassport(uint8 _license, licenseStatus _status) adminValidation public {
        User storage passport =  passports[msg.sender];
        passport.license = _license;
        passport.status = _status;
    }


    function setCountryBalance(string memory _countryName, uint256 _balance) adminValidation public {
        countryVault[_countryName] = Country(_countryName, _balance);
    }

    function updateCountryBalance(string memory _countryName, uint256 _amount) adminValidation public returns(uint256) {
       Country storage country = countryVault[_countryName];
        return (country.balance += _amount);
    }

    function requestLoan(address _user, uint256 _amount, string memory _countryName) public {
        Country storage country = countryVault[_countryName];
        require(_amount >= country.balance, "Insufficient funds");
        User storage passport = passports[_user];
        require(passport.license <= 2, "Your license is low to qualify for a loan");
        passport.balance += _amount;
        country.balance -= _amount;
    }
}