--   https://sqlzoo.net/wiki/Scottish_Parliament

-- 1. One MSP was kicked out of the Labour party and has no party. Find him.

SELECT Name
FROM msp
WHERE Party IS NULL


-- 2. Obtain a list of all parties and leaders.

SELECT Name, Leader
FROM party


-- 3. Give the party and the leader for the parties which have leaders.

SELECT Name, Leader
FROM party
WHERE Leader IS NOT NULL

-- 4. Obtain a list of all parties which have at least one MSP.

SELECT Name
FROM   party
WHERE  Code = ANY ( SELECT Party
                    FROM msp );
                    
         
-- 5. Obtain a list of all MSPs by name, give the name of the MSP and the name of the party where available. Be sure that Canavan MSP, Dennis is in the list. Use ORDER BY msp.name to sort your output by MSP.           

SELECT msp.Name, party.Name
FROM   msp LEFT JOIN party
ON     msp.Party=party.Code
ORDER BY msp.Name


-- 6. Obtain a list of parties which have MSPs, include the number of MSPs

SELECT party.Name, COUNT(msp.Name)
FROM party JOIN msp
ON msp.Party=party.Code
GROUP BY party.Name


-- 7. A list of parties with the number of MSPs; include parties with no MSPs.

SELECT party.Name, COUNT(msp.Name)
FROM party LEFT JOIN msp
ON msp.Party=party.Code
GROUP BY party.Name


