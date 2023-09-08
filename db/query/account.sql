-- name: CreateAccounts :one
INSERT INTO Accounts ( 
     owner,
     balance,
     currency

) VALUES (
     $1,
     $2,
     $3
) RETURNING *;



-- name: GetAccounts :one
SELECT * FROM Accounts
WHERE id = $1 LIMIT 1;

-- name: ListAccounts :many
SELECT * FROM Accounts
ORDER BY id
LIMIT $1
OFFSET $2;


-- name: UpdateAccounts :exec
UPDATE Accounts 
SET balance = $2
WHERE id = $1;


-- name: DeleteAccounts :exec
DELETE FROM Accounts WHERE id = $1;