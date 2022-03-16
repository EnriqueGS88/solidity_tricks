// SPDX-License-Identifier: MIT

/**
    * When checking the balance of a contract's own ether
    * Save gas by using selfbalance() in Assembly
    * instad of address(this).balance
 */

 // Source: https://twitter.com/0xKitsune/status/1504149360057147400/photo/1

// Traditional form to check ETH balance of own contract
// Gas: 148
function gasBenchmarkAddressThisBalance( ) external view returns ( uint256 ) {
     return address( this ).balance;
 }


// Alternative form with Assembly
// Gas: 133
function gasBenchmarkSelfBalance( ) external view returns ( uint256 ) {
    assembly {
        let x := selfbalance( )
        mstore( 0x0, x )
        return( 0x0, 32 )
    }
}