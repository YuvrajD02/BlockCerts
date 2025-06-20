// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract BlockCerts {
    struct Certificate {
        string certId;
        string studentName;
        string courseName;
        string issuer;
        uint256 issueDate;
    }

    mapping(string => Certificate) public certificates;
    address public admin;

    constructor() {
        admin = msg.sender;
    }

    function issueCertificate(
        string memory _certId,
        string memory _studentName,
        string memory _courseName,
        string memory _issuer
    ) public {
        require(msg.sender == admin, "Only admin can issue");
        certificates[_certId] = Certificate(_certId, _studentName, _courseName, _issuer, block.timestamp);
    }

    function getCertificate(string memory _certId) public view returns (Certificate memory) {
        return certificates[_certId];
    }

    function changeAdmin(address _newAdmin) public {
        require(msg.sender == admin, "Not authorized");
        admin = _newAdmin;
    }
}
