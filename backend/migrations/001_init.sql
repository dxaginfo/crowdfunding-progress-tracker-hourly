CREATE TABLE users (id SERIAL PRIMARY KEY, name VARCHAR(128), email VARCHAR(256) UNIQUE, password_hash VARCHAR(256), created_at TIMESTAMP DEFAULT now());
CREATE TABLE campaigns (id SERIAL PRIMARY KEY, user_id INTEGER REFERENCES users(id), title VARCHAR(256), description TEXT, target_amount NUMERIC, current_amount NUMERIC DEFAULT 0, end_date DATE, created_at TIMESTAMP DEFAULT now());
CREATE TABLE rewards (id SERIAL PRIMARY KEY, campaign_id INTEGER REFERENCES campaigns(id), tier_description TEXT, amount NUMERIC, available_count INTEGER);
CREATE TABLE transactions (id SERIAL PRIMARY KEY, user_id INTEGER REFERENCES users(id), campaign_id INTEGER REFERENCES campaigns(id), amount NUMERIC, timestamp TIMESTAMP DEFAULT now(), status VARCHAR(64));
CREATE TABLE updates (id SERIAL PRIMARY KEY, campaign_id INTEGER REFERENCES campaigns(id), title VARCHAR(256), content TEXT, created_at TIMESTAMP DEFAULT now());
