SELECT COUNT(*)
    FROM players
    WHERE (bats = 'R' AND throws = 'L')| (bats = 'L' AND throws = 'R');
