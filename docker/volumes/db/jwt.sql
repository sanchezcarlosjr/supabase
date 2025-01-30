\set jwt_secret `echo "$JWT_SECRET"`
\set jwt_exp `echo "$JWT_EXP"`

--select vault.create_secret(:'jwt_secret', 'app.jwt_secret', 'The jwt secret');
--select vault.create_secret(:'jwt_exp', 'app.jwt_exp', 'jwt expiration');
