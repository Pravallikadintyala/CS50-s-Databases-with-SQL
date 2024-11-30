-- Create the view message
CREATE VIEW message AS
SELECT
    substr(s1.sentence, 98, 4) || ' ' ||
    substr(s2.sentence, 3, 5) || ' ' ||
    substr(s3.sentence, 72, 9) || ' ' ||
    substr(s4.sentence, 7, 3) || ' ' ||
    substr(s5.sentence, 12, 5) || ' ' ||
    substr(s6.sentence, 50, 7) || ' ' ||
    substr(s7.sentence, 44, 10) || ' ' ||
    substr(s8.sentence, 14, 5) AS phrase
FROM
    sentences s1, sentences s2, sentences s3, sentences s4,
    sentences s5, sentences s6, sentences s7, sentences s8
WHERE
    s1.id = 14 AND s2.iyd = 114 AND s3.id = 618 AND s4.id = 630
    AND s5.id = 932 AND s6.id = 2230 AND s7.id = 2346 AND s8.id = 3041;

