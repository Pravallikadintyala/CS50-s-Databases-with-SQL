SELECT "first_name" , "last_name" , "debut" FROM "players"
    WHERE "birth_city" LIKE '%Pittsburgh%'
    ORDER BY "debut" DESC;
