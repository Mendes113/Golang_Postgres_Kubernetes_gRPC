CREATE TABLE "Account" (
  "id" bigserial PRIMARY KEY,
  "owner" varchar NOT NULL,
  "balance" bigint NOT NULL,
  "currency" varchar NOT NULL,
  "created_at" timestamptz NOT NULL DEFAULT (now())
);

CREATE TABLE "entries" (
  "id" bigserial PRIMARY KEY,
  "account_id" bigint NOT NULL,
  "amount" bigint NOT NULL,
  "created_at" timestamptz NOT NULL DEFAULT (now())
);

CREATE TABLE "tranfers" (
  "id" bigserial PRIMARY KEY,
  "from_account_id" bigint NOT NULL,
  "to_from_account_id" bigint NOT NULL,
  "amount" bigint NOT NULL,
  "created_at" timestamptz NOT NULL DEFAULT (now())
);

CREATE INDEX ON "Account" ("owner");

CREATE INDEX ON "entries" ("account_id");

CREATE INDEX ON "tranfers" ("from_account_id");

CREATE INDEX ON "tranfers" ("to_from_account_id");

CREATE INDEX ON "tranfers" ("from_account_id", "to_from_account_id");

COMMENT ON COLUMN "entries"."amount" IS 'can be negative or positive ';

COMMENT ON COLUMN "tranfers"."amount" IS 'must be positive';

ALTER TABLE "entries" ADD FOREIGN KEY ("account_id") REFERENCES "Account" ("id");

ALTER TABLE "tranfers" ADD FOREIGN KEY ("from_account_id") REFERENCES "Account" ("id");

ALTER TABLE "tranfers" ADD FOREIGN KEY ("to_from_account_id") REFERENCES "Account" ("id");
