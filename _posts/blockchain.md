---
layout: post
title:  "Creating my own Blockchain in Java"
date:   2021-05-09 21:30:00 -0700
categories: Learning
---

A couple of weeks ago I watched a 3b1b video which basically presented the idea of Blockchain as nothing more than a publicly available information where the validity of the currency is based on cryptography, namely the SHA-2 Algorithm. Truthfully, I didn't believe the idea was that simple until I tried to code it myself. 

I believe what he had to say and here's why. In the block chain data structure there are really 3 parts that I consider important - the transactions, the Block (duh) and the nonce.

Transactions - as you expected, this would be all the data that involves sending money back and forth, think "I paid you 0.3 bitcoin" "you paid me 0.1 bitcoin". This serves as a way to form a ledger we use in the block next.

Block - This still is a data structure, I thought of it as a recording of the ledger of transactions. You would essentially store transactions and metadata surrounding them (when you initialized the block, what index this is in the linkedlist, the hash of the previous block, etc.) before you find the nonce.

Nonce (hash) - to me, this was the coolest part of the whole thing. The entire encryption backbone is built of the SHA-2 algorithm, which literally stands for secure hashing algorithm 2 (so you KNOW this is twice as the first one, which had security breaches found in it), but the idea isn't that all the data has to be encrypted before sending it to miners. The idea actually flips the effort of encryption on the miner, where they have to attach a number to all the data from the block - some of which I mentioned above - and find a number that has some number of zeros. To me this is the coolest thing because it makes me realize again some of the randomest elements of math, where for example, it is said to be "impossible" to reverse engineer the SHA-2 algorithm, and apply it in ways that have the opportunity to change the financial structure as we know it. 

As far as what comes next, I'm looking to fix it up more and test the code I wrote up on it, maybe try to write something on Merkle trees next. Thanks for tuning in :). 