-- Update rows in a Table

Update auteur
  SET pays='UK'
WHERE LOWER(pays) = LOWER('United Kingdom');

Update auteur
  SET pays='Taiwan'
WHERE LOWER(pays) LIKE '%taiwan%';

Update auteur
  SET pays='China'
WHERE LOWER(pays) LIKE '%china%';

Update auteur
  SET pays='Netherlands'
WHERE LOWER(pays) LIKE LOWER('%Netherlands%');

Update auteur
  SET pays='Singapore'
WHERE LOWER(pays) LIKE LOWER('%Singapore%');

Update auteur
  SET pays='Switzerland'
WHERE LOWER(pays) LIKE LOWER('%Switzerland%');

Update auteur
  SET pays='France'
WHERE LOWER(pays) LIKE LOWER('%France%');

Update auteur
  SET pays='UAE'
WHERE LOWER(pays) LIKE LOWER('%United Arab Emirate%');

Update auteur
  SET pays='USA'
WHERE LOWER(pays) LIKE LOWER('%United States%');

Update auteur
  SET pays='Spain'
WHERE LOWER(pays) LIKE LOWER('%Spain%');

Update auteur
  SET pays='UK'
WHERE LOWER(pays) LIKE LOWER('%UK%');

SELECT * FROM auteur WHERE LOWER(pays) LIKE LOWER('%Scotland%');

commit;