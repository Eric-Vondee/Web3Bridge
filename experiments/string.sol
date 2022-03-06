/**
 * STRING CONCATENTATION
 * BYTES CONCATENTATION
 * CONVERTING STRINGS TO BYTES
 * CONVERTING BYTES TO STRING
 * BYTES SPLITTING e.g splitting bytes32 into bytes(8 8, 16)
 * STRING COMPARISON
 */

contract Strings {
    /*
     * string concatentation
     */
    function concatenate(
        string calldata _firstItem,
        string calldata _secondItem
    ) public pure returns (string memory c) {
        return string(abi.encodePacked(_firstItem, _secondItem));
    }

    /*
     * bytes to string concatentation
     */
    function bytesToStringConcatentaion(bytes memory _byte1, bytes memory _byte2)
        public
        pure
        returns (string memory)
    {
        return string(bytes.concat(_byte1, _byte2));
    }


    /*
     * bytes concatentation which outputs byte32
     */
    // function bytesConcatentaion(bytes32 _byte1, bytes32 _byte2)
    //     public
    //     pure
    //     returns (bytes32)
    // {
    //     return (bytes32(bytes.concat(_byte1, _byte2)));
    // }

    function bytesConcatentaion(bytes32 _byte1, bytes32 _byte2)
        public
        pure
        returns (bytes32)
    {
        return (keccak256(abi.encodePacked(_byte1, _byte2)));
    }


    /*
     * converting strings to bytes32
     */
    function convertToBytes(string memory _name)
        public
        pure
        returns (bytes32)
    {
        return (bytes32(bytes(_name)));
    }

    /*
     * converting bytes to strings
     */
    function bytesToString(bytes memory _name)
        public
        pure
        returns (string memory c)
    {
        c = string(_name);
        return c;
    }

    /*
     * bytes splitting
     */

    function bytesSplitting(bytes32 _data)
        public
        pure
        returns (bytes16 i, bytes16 k)
    {
        i = bytes16(_data);
        k = bytes16(_data << (64 * 1));
        return (i, k);
    }

       function bytes3ToColorString(bytes3 _color) public pure returns (string memory) {
        bytes memory numbers = "0123456789ABCDEF";
        bytes memory toString = new bytes(6);
        uint256 pos;
        for (uint256 i; i < 3; i++) {
            toString[pos] = numbers[uint8(_color[i] >> 4)];
            pos++;
            toString[pos] = numbers[uint8(_color[i] & 0x0f)];
            pos++;
        }
        return string(toString);
    }

    function convertToBytes3(string memory _name) public pure returns(bytes3){
        return (bytes3(bytes(_name)));
    }
}
