pragma solidity 0.8.7;

///@title : création du token paymium
///@author : aymeric_fulop

contract PaymiumToken {
    
    /// payniumToken est initialisé à 10000
    /// balanceETH nous permettra de voir le nombre total d'ether envoyé
    uint paymiumToken = 10000;
    uint balanceETH;

    ///@return la quantité de payniumToken dans ce contrat
    function getBalancePaymiumToken() public view returns (uint) {
        return paymiumToken;
    }

    ///@return la quantité d'ether envoyé 
    function getBalanceEther() public view returns (uint) {
        return balanceETH / 1 ether;
    }

    ///@return la conversion des ether en paymiumToken (permet la réutilisation dans d'autres fonctions)
    function convert(uint _value) internal pure returns (uint) {
        return (_value / 1 ether)*10;
    }

    /// dépot d'ETH pour obtenir des paymiumToken
    function deposit() external payable {
       balanceETH = msg.value + balanceETH; //on incrémente la quantité d'ETH
       uint balanceTransaction = msg.value; //permet de récuperer les ETH envoyés à la fonction
       paymiumToken = paymiumToken - convert(balanceTransaction); //réduction du nombre de paymiumToken en fonction de l'ETH reçu
    }


}

///@dev : au niveau optimisation il aurait pu être intéressant d'utiliser la librairie SafeMath
/// Consige du test : j'ai ajouté les fonctions getBalancceEther(facilite les test du SmartContract) et convert(amélioration lisibilité)