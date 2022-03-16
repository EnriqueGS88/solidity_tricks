// SPDX-License-Identifier: MIT

/**
    * NFT minting with 30-Day guarantee
    * You can use `30 days` instead of 2_592_000
 */

// Below comments by Hadrien Crubois

 function refund( uint256 _tokenId ) external {
    require( ownerOf( _tokenId ) == msg.sender ); // redundant - in the imported contracts there is already a check for this
    require( block.timestamp < mintTimestamps[_tokenId] + 2_592_000 ); // Alternatively you can use `30 days`
    require( isApprovedForAll( msg.sender, address( this ) ) ); // redundant - this check is already done in the transferFrom call

    transferFrom( msg.sender, address( this ), _tokenId ); // can be replaced with a `_transfer`
    ( bool refundFunds, ) = payable( msg.sender ).call{ value: MINT_COST }( "" );
    require( refundFunds );
 }

 function refundByCrubois( uint256 _tokenId ) external {
    require( block.timestamp < mintTimestamps[_tokenId]) + 30 days);
    transferFrom( msg.sender, address( this ), _tokenId ); // This works as an Approval and a Transfer together
 }

 function withdrawFunds( ) external onlyOwner {
    require( block.timestamp > mintTimestamps[ totalSupply ] + 2_592_000 );

    ( bool transferFunds, ) = payable( msg.sender ).call{ value: address(this).balance }( "" );
    require( transferFunds );
 }

 // Source: https://twitter.com/fiveoutofnine/status/1497655772867702793/photo/1

