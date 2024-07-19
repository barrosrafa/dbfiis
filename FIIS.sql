CREATE TABLE ticker
  (id INT NOT NULL AUTO_INCREMENT, acronym VARCHAR(6) NOT NULL, active BOOLEAN, PRIMARY KEY(id), UNIQUE(acronym));

  
CREATE TABLE detailFund(
  id INT NOT NULL AUTO_INCREMENT,
  fundName VARCHAR(100),
  assetQuantities INT NOT NULL,
  numQuotaHolders INT,
  ipoDate DATE,
  fundSite VARCHAR(100),
  percentageCash DECIMAL,
  typeManagement BOOLEAN,
  numQuotas INT,
  cnpj BIGINT,
  hasDeadline BOOLEAN,
  targetAudience_id INT NOT NULL,
  rating DECIMAL,
  ticker_id INT NOT NULL,
  PRIMARY KEY(id)
);

ALTER TABLE detailFund
  ADD CONSTRAINT ticker_detailFund
    FOREIGN KEY (ticker_id) REFERENCES ticker (id);

CREATE TABLE targetAudience
  (id INT NOT NULL AUTO_INCREMENT, nameAudience VARCHAR(50), PRIMARY KEY(id));

ALTER TABLE detailFund
  ADD CONSTRAINT targetAudience_detailFund
    FOREIGN KEY (targetAudience_id) REFERENCES targetAudience (id);



CREATE TABLE historicalData(
  id INT NOT NULL AUTO_INCREMENT,
  Date DATE,
  Price DECIMAL,
  vol DECIMAL,
  ticker_id INT NOT NULL,
  PRIMARY KEY(id)
);

ALTER TABLE historicalData
  ADD CONSTRAINT ticker_historicalData
    FOREIGN KEY (ticker_id) REFERENCES ticker (id);

CREATE TABLE Dividend(
  id INT NOT NULL AUTO_INCREMENT,
  comDate DATE,
  exDate DATE,
  value DECIMAL,
  ticker_id INT NOT NULL,
  PRIMARY KEY(id)
);

ALTER TABLE Dividend
  ADD CONSTRAINT ticker_Dividend FOREIGN KEY (ticker_id) REFERENCES ticker (id)
  ;

CREATE TABLE fee(
  id INT NOT NULL AUTO_INCREMENT,
  managementFee DECIMAL,
  AdmFee DECIMAL,
  performanceFee DECIMAL,
  ticker_id INT NOT NULL,
  PRIMARY KEY(id)
);

ALTER TABLE fee
  ADD CONSTRAINT ticker_fee FOREIGN KEY (ticker_id) REFERENCES ticker (id);

CREATE TABLE administration(
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(100),
  cnpj BIGINT,
  phone INT,
  email VARCHAR(100),
  ticker_id INT NOT NULL,
  PRIMARY KEY(id)
);

ALTER TABLE administration
  ADD CONSTRAINT ticker_administration FOREIGN KEY (ticker_id) REFERENCES ticker (id)
  ;

CREATE TABLE manager(
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(100),
  cnpj BIGINT,
  phone INT,
  email VARCHAR(100),
  ticker_id INT NOT NULL,
  PRIMARY KEY(id)
);

ALTER TABLE manager
  ADD CONSTRAINT ticker_manager FOREIGN KEY (ticker_id) REFERENCES ticker (id);

CREATE TABLE classification(
  id INT NOT NULL AUTO_INCREMENT,
  name INT,
  ticker_id INT NOT NULL,
  PRIMARY KEY(id)
);

ALTER TABLE classification
  ADD CONSTRAINT ticker_classification
    FOREIGN KEY (ticker_id) REFERENCES ticker (id);
