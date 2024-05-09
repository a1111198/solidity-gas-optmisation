// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.15;

contract OptimizedArraySum {
    // Do not modify this
    uint256[] array;

    // Do not modify this
    function setArray(uint256[] memory _array) external {
        require(_array.length <= 10, 'too long');
        array = _array;
    }

    // optimize this function
    function getArraySum() external view returns (uint256) {
        uint256 sum;
        //here returing 0 instaed of sum will cost 5 gas more as will have to make 1 push and 1 pop more for this extra 0 while sum is already in stack.
        // here assuming we are calling Empty array 21 more than any any non empty array as we are using array.lemgth 2 time so save 5 gas for storing length variable in memory and using from memeory.
        // here If we are using less than 21 times then using caching first is good approach from gas perspective inorder to save cost of warm access.
        if (array.length == 0) return sum;

        uint256 length = array.length;
        for (uint256 i = 0; i < length; i++) {
            sum += array[i];
        }
        return sum;
    }
}
