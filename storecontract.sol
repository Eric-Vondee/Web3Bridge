// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

//Create Laptop Products 
//Get All products by array of structs

contract Store {

    //struct to handle multiple models
    struct LaptopModels {
        uint8 ramSize;
        uint8 screenSize;
        uint16 romSize;
        uint256 laptopPrice;
        string laptopModel;
    }

    struct LaptopBrands {
        string brandName;
        mapping(uint=>LaptopModels) laptops;
        string[] brandStoreAddress;
    }

    // for returns
    struct LaptopBrandsWithoutModels {
        string brandName;
        string[] brandStoreAddress;
    }

    mapping(string => LaptopBrands) laptops;
    uint laptopIndex = 0;

    function createLaptop(uint8 _ramSize, string[] memory _storeAddress, uint8 _screenSize, uint16 _romSize, uint16 _laptopPrice, string calldata _laptopModel, string calldata _brandName) public {
        laptopIndex = laptopIndex +1;
        LaptopBrands storage c = laptops[_brandName];
        LaptopModels memory laptopModel = LaptopModels(_ramSize, _screenSize, _romSize, _laptopPrice, _laptopModel);
        c.brandName = _brandName;
        c.brandStoreAddress = _storeAddress;
        c.laptops[laptopIndex] = laptopModel;
    }

    function getLaptops(string[] memory _brandName) external view returns(LaptopBrandsWithoutModels[] memory cc){
        cc = new LaptopBrandsWithoutModels[](_brandName.length);
        for(uint i = 0; i < _brandName.length; i++){
            LaptopBrands storage laptop = laptops[_brandName[i]];
            LaptopBrandsWithoutModels memory c = cc[i];
            c.brandName = laptop.brandName;
            c.brandStoreAddress = laptop.brandStoreAddress;
        }
    }

    function checkLaptopModels(string memory _brandName, uint8 _index) public view returns(LaptopModels memory){
         LaptopBrands storage laptop = laptops[_brandName];
         return laptop.laptops[_index];
    }
}