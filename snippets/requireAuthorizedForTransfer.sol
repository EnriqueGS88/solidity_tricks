// SPDX-License-Identifier: MIT

/**
    * Example of shortcircuiting
    * When doing conditional checks, test first for the function that is  most commonly called by end-users
    * By doing so, you save gas on testing for a function that seldomly is being used

    * In this case, isApprovedForAll() is more used than getApproved()
 */


require( msg.sender == from || isApprovedForAll([from][msg.sender]) || msg.sender == getApproved[id], "Not Authorized" );

// Source: https://twitter.com/r_ross_campbell/status/1501682607222038532?t=WSCaIXabeoD4tVpa0zpRoA&s=19
