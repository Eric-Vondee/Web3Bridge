contract Bytes {
    function getBytes(string calldata _name) public pure returns (bytes5) {
        return (bytes5(bytes(_name)));
    }

    function lengthBytes(string calldata _name) public pure returns (uint8) {
        bytes4 c = bytes4(bytes(_name));
        return (c.length);
    }

    function bitwise() public pure returns (bytes1) {
        bytes1 a = 0xb5; //  [10110101]
        bytes1 b = 0x56; //  [01010110]
        bytes1 c = 0xe3;
        return (c ^ b);
    }

    function shiftOperator(bytes4 a, uint256 n) public pure returns (bytes4) {
        return (a >> n);
    }

    function rightShiftOperator(bytes32 a, uint256 n)
        public
        pure
        returns (bytes32)
    {
        uint8 c = uint8(a);
    }
}
