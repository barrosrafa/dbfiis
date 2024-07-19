CREATE TABLE ticker(
  id INT NOT NULL AUTO_INCREMENT,
  acronym VARCHAR(6) NOT NULL,
  active BOOLEAN,
  detailFund_id INT NOT NULL,
  classification_id INT NOT NULL,
  administration_id INT NOT NULL,
  manager_id INT NOT NULL,
  fee_id INT NOT NULL,
  PRIMARY KEY(id),
  Unique(acronym));

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
  PRIMARY KEY(id));

ALTER TABLE ticker
  ADD CONSTRAINT detailFund_ticker
    FOREIGN KEY (detailFund_id) REFERENCES detailFund (id);

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
  price DECIMAL,
  ticker_id INT NOT NULL,
  PRIMARY KEY(id)
);

ALTER TABLE Dividend
  ADD CONSTRAINT ticker_Dividend FOREIGN KEY (ticker_id) REFERENCES ticker (id);

CREATE TABLE fee(
  id INT NOT NULL AUTO_INCREMENT,
  managementFee DECIMAL,
  AdmFee DECIMAL,
  performanceFee DECIMAL,
  PRIMARY KEY(id));

ALTER TABLE ticker
  ADD CONSTRAINT fee_ticker FOREIGN KEY (fee_id) REFERENCES fee (id);

CREATE TABLE manager(
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(100),
  cnpj BIGINT,
  phone INT,
  email VARCHAR(100),
  PRIMARY KEY(id));

ALTER TABLE ticker
  ADD CONSTRAINT manager_ticker FOREIGN KEY (manager_id) REFERENCES manager (id);

CREATE TABLE administration(
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(100),
  cnpj BIGINT,
  phone INT,
  email VARCHAR(100),
  PRIMARY KEY(id));

ALTER TABLE ticker
  ADD CONSTRAINT administration_ticker
    FOREIGN KEY (administration_id) REFERENCES administration (id);

CREATE TABLE classification(id INT NOT NULL AUTO_INCREMENT, name INT, PRIMARY KEY(id));

ALTER TABLE ticker
  ADD CONSTRAINT classification_ticker
    FOREIGN KEY (classification_id) REFERENCES classification (id);














