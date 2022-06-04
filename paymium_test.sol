pragma solidity 0.8.7;

//@title : création du token paymium
//@author : aymeric_fulop

contract PaymiumToken {
    
    uint paymiumToken = 10000;
    uint balanceETH;

    function getBalancePaymiumToken() public view returns (uint) {
        return paymiumToken;
    }

    function getBalanceEther() public view returns (uint) {
        return balanceETH / 1 ether;
    }


    function deposit() external payable {
       balanceETH = msg.value + balanceETH;
       uint balanceTransaction = msg.value;
       uint conversion = (balanceTransaction / 1 ether)*10;
       paymiumToken = paymiumToken - conversion;
    }


}