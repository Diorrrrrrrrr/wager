Config = {
    ESXTrigger = "esx:getSharedObject",
    ESXGangsName = "esx_gangs",
    MinimumBet = 10000, --> Per player.
    MaximumBet = 5000000, --> Per player.
    WeaponToUse = "WEAPON_APPISTOL",
    ReviveEvent = "esx_ambulancejob:revive",
    EndCoords = vector3(-895.35, -778.85, 15.91),
    KickOutOfAreas = false, --> Remove non wager players from wager areas? (Will false remove people who have shit pcs)
    WagerAreas = {
        ["1v1"] = {
            {
                P1 = {coords = vector3(-932.62, -780.68, 15.92), heading = 144.84},
                P2 = {coords = vector3(-949.92, -803.15, 15.92), heading = 322.59},
            },
            {
                P1 = {coords = vector3(3111.69, -862.93, 318.0), heading = 270.84}, 
                P2 = {coords = vector3(3145.46, -863.69, 318.0), heading = 92.59},
            },
        },
        ["2v2"] = {
            {
                T1 = {
                    P1 = {coords = vector3(-932.62, -780.68, 15.92), heading = 144.84},
                    P2 = {coords = vector3(-932.62, -780.68, 15.92), heading = 144.84}
                },
                T2 = {
                    P1 = {coords = vector3(-949.92, -803.15, 15.92), heading = 322.59},
                    P2 = {coords = vector3(-949.92, -803.15, 15.92), heading = 322.59}
                }
            },
            {
                T1 = {
                    P1 = {coords = vector3(3203.6499023438, -964.00958251953, 318.8962097168), heading = 87.96},
                    P2 = {coords = vector3(3203.78125, -970.34027099609, 318.8962097168), heading = 86.02}
                },
                T2 = {
                    P1 = {coords = vector3(3175.6306152344, -970.46502685547, 318.89587402344), heading = 274.37},
                    P2 = {coords = vector3(3175.4711914062, -964.18212890625, 318.89587402344), heading = 264.54}
                }
            }
        }
    },

}

ClientReviveFunction = function()
    TriggerServerEvent("esx_ambulancejob:revive", GetPlayerServerId(PlayerId()))
    NetworkResurrectLocalPlayer(GetEntityCoords(PlayerPedId()), true, true, false)
end

Messages = {
    ["LeftWon"] = "Your opponent has left the game, you have automatically won!",
    ["LeftLost"] = "Your teammate has left the game, you have automatically lost!",
    ["LeftWon2v2"] = "One of your oppenents has left the game, you have automatically won!",
    ["Won"] = "You have won the wager and ${0}!",
    ["Lost"] = "You have lost the wager and {0}!",
    ["MissingArg"] = "You need to write a server ID and a wager amount!",
    ["MissingArg2v2"] = "You need to write three ID:s and a wager amount to invite!",
    ["WrongBet"] = "You need to write a wager amount between {0} and {1}!",
    ["Poor"] = "You dont have enough money!",
    ["OnePoor"] = "{0} does not have enough money!",
    ["SentInvite"] = "You sucessfully sent an invite to {0}!",
    ["GotInvite"] = "You have received an invite from {0}.<br>Amount is ${2}!<br>Write /wageraccept {1} OR /wagerdecline {1} to accept/decline!",
    ["SpotTaken"] = "Your wager spot was taken, removed invite!",
    ["InviteRemoved"] = "Invite from {0} removed because your wager spot was taken!",
    ["TimedOut"] = "Invite from {0} timed out!",
    ["TimedOut2"] = "Invite to {0} timed out!",
    ["Declined"] = "{0} has declined your invite!",
    ["YouDeclined"] = "You have declined the invite from {0}!",
    ["TooMany"] = "{0} has accepted your invite but there are too many ongoing wagers!",
    ["Accepted"] = "{0} has accepted your invite!",
    ["AlreadyInvited"] = "You have already sent out an invite!",
    ["Yourself"] = "You cannot invite yourself!",
    ["AlreadyIn"] = "You are already in a wager!",
    ["PlayerIn"] = "That player is already in a wager!",
    ["TooManyWagers"] = "There are too many ongoing wagers!",
    ["Offline"] = "Invalid ID! Player is not online!",
    ["NoInvite"] = "There is no invite from that player!",
    ["YouHaveAccepted"] = "You have accepted the invite from {0}!",
    ["GoneOff"] = "That player has gone offline!",
    ["WriteID"] = "You need to write an ID!",
    ["Sent2v2"] = "You sucessfully sent an invite to {0}, {1} and {2}!",
    ["Received2v2"] = "You have received a 2v2 invite against {0} & {2}, your teammate is {3}.<br>The wager amount is ${4}!<br>Write /wager2accept {1} OR /wager2decline {1} to accept/decline!",
    ["2v2Timed"] = "2v2 invites timed out!",
    ["Declined2v2"] = "Someone declined your 2v2 invite!",
    ["TooMany2v2"] = "Your 2v2 invites were accepted but there are too many ongoing 2v2 wagers!",
    ["Accepted2v2"] = "Your 2v2 invites were accepted, starting!",
    ["PlayerIn2v2"] = "One (or more) of those players are already in a wager!",
    ["TooManyOngoing2v2"] = "There are too many ongoing 2v2 wagers!",
    ["Offline2v2"] = "Invalid ID(s)! One (or more) of the players are not online!",
}