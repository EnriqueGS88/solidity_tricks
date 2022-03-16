// SPDX-License-Identifier: MIT

/**
    * In both example below, the only difference is in lines 14 and 24
    * Users most commonly select isApprovedForAll() when authorizing a contract to transfer their NFTs
    * The reason is that isApprovedForAll() is set for all NFTs, that is a one-off payment fee the user does
    * Hence in Example 2 it makes more sense to first check the isApprovedForAll() instead of getApproved()
 */

// Example 1

function _isApprovedOrOwner( address spender, uint256 tokenId )
internal view virtual returns ( bool ) {
    require( _exists( tokenId ), "ERC721: operator query for non-fungible token" );
    address owner = ERC721.ownerOf( tokenId );
    return ( spender == owner || getApproved( tokenId ) == spender || isApprovedForAll( owner, spender ) );
}

/**
    * Since we leave getApproved() to be checked at the end, we save an SLOAD for most cases where an approval has been set
 */


// Example 2

function _isApprovedOrOwner( address spender, uint256 tokenId )
internal view virtual returns ( bool ) {
    require( _exists( tokenId ), "ERC721: operator query for non-fungible token" );
    address owner = ERC721.ownerOf( tokenId );
    return ( spender == owner || isApprovedForAll( owner, spender ) || getApproved( tokenId ) == spender) ;
}

// Source: https://twitter.com/vectorized_dev/status/1499014372668379145?t=O9nc4N2w1IlMxMZlQpUXKA&s=19