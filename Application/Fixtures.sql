

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;


SET SESSION AUTHORIZATION DEFAULT;

ALTER TABLE public.posts DISABLE TRIGGER ALL;

INSERT INTO public.posts (id, title, body, created_at) VALUES ('bd8b386d-cce4-45b0-adf2-a19952f5f362', 'Car', 'dgfsdafasf', '2020-09-23 20:28:45.075781+01');
INSERT INTO public.posts (id, title, body, created_at) VALUES ('5009173d-39db-49e7-af96-75b5ab30e50e', 'Laptop', 'Has buttons and a screen very nice', '2020-09-23 20:42:30.417955+01');


ALTER TABLE public.posts ENABLE TRIGGER ALL;


ALTER TABLE public.comments DISABLE TRIGGER ALL;

INSERT INTO public.comments (id, post_id, author, body, created_at) VALUES ('1de9007a-b690-4f2d-a76e-d08cc7d8e308', '4ef48ade-e7f0-4afb-b4d9-5d4d1f7b9b86', 'Marc', 'This is the first comment!', '2020-06-07 12:11:22.07897+01');
INSERT INTO public.comments (id, post_id, author, body, created_at) VALUES ('7386928d-a6fc-4f20-ada9-333c32345453', '4ef48ade-e7f0-4afb-b4d9-5d4d1f7b9b86', 'Marc', 'This is a second comment!', '2020-06-07 12:11:30.718887+01');


ALTER TABLE public.comments ENABLE TRIGGER ALL;


ALTER TABLE public.users DISABLE TRIGGER ALL;

INSERT INTO public.users (id, email, password_hash, locked_at, failed_login_attempts) VALUES ('aacc82f2-21b3-4be0-b3e4-bc0fbbf990af', 'fanie@oen.com', 'sha256|17|Euu1JQXbcU2ZAvz77C6z/g==|+iDUx36I+TP8+PKxWYC8RIRqag1+B9qDcBZPXcrOuRk=', NULL, 0);
INSERT INTO public.users (id, email, password_hash, locked_at, failed_login_attempts) VALUES ('bc72ae92-51c2-4cae-9380-10746a28099e', 'admin@admin', 'sha256|17|RtofISSZkTy6SDV3TOrSeg==|ctPWQyOdyvtY8+0WxSHsu9AAQEFbYbRVweT8m6+IxDk=', NULL, 0);
INSERT INTO public.users (id, email, password_hash, locked_at, failed_login_attempts) VALUES ('2a6b44da-2dad-4385-98d7-e58bb01f2a66', 'das@oen.com', 'sha256|17|S1UxLPCdpwtQJoHnDFhZfQ==|Kb3ZNBRXENqr5UFKjOoqF+aKfZKZcMOCaXfTtiPvbPg=', NULL, 0);
INSERT INTO public.users (id, email, password_hash, locked_at, failed_login_attempts) VALUES ('cb2d5b78-17f8-4e26-8755-f6ee4b18792e', 'hi@bye.com', 'sha256|17|PV2aN6nTqgeFXzuHZRF8Gw==|GMh8xdWsPu8xof+oKl5VnF88b7ddU3uMuvAOY7nAvvc=', NULL, 0);


ALTER TABLE public.users ENABLE TRIGGER ALL;


ALTER TABLE public.listings DISABLE TRIGGER ALL;



ALTER TABLE public.listings ENABLE TRIGGER ALL;


