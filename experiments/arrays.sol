pragma solidity ^0.8.0;

contract Arrays {

    uint256[] public myNumberArray;

    /*
    * function to push an element to an array
     */
    function setArray() public {
        myNumberArray.push(100);
    }

    /*
    * function to get data @position 0
     */
    function getArrayData() public view returns(uint256){
        return myNumberArray[0];
    }

    /*
    * function to delete remove an array  
    */
    function deleteArray() public {
        delete myNumberArray[0];
    }

    /*
    * update an array position 0
     */
    function updateArray() public {
        myNumberArray[0] = 2;
    }

    /*
    *  update the value an index 0
    * 
    */
    function memoryArray() public view returns(uint256[] memory){
        uint256[] memory newArrays = new uint256[](100);
         newArrays[0] = 1;
         return newArrays;
            // c[0] = 100;
        //  return c;
    }

    /*
    * meddlinf memory array 
    */
    function modifyMemoryArray() public view returns(uint256){
        uint256[] memory newArray = new uint256[](100);
         newArray[0] = 1;
         assembly {
             mstore(newArray, sub(mload(newArray), 99))
         }
    }

}