-- patients table

CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    name varchar(120),
    date_of_birth DATE
)

-- invoices table

CREATE TABLE invoices (
    id SERIAL PRIMARY KEY,
    total_amount decimal(10,2),
    generated_at timestamp,
    payed_at timestamp,
    medical_history_id int,
    FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id)
);

-- invoice_items table

CREATE TABLE invoice_items (
    id SERIAL PRIMARY KEY,
    unit_price decimal NOT NULL,
    quantity INT ,
    total_price decimal NOT NULL,
    invoice_id INT, 
    treatment_id INT,
    FOREIGN KEY (invoice_id) REFERENCES invoices(id),
    FOREIGN KEY (treatment_id) REFERENCES treatment(id)
);

-- treatment table

CREATE TABLE treatment (
   id SERIAL PRIMARY KEY,
   types VARCHAR(244),
   names VARCHAR(244)   
);

-- medical_histories table

CREATE TABLE medical_histories (
    id SERIAL PRIMARY KEy,
    admitted_at timestamp,
    patient_id int,
    status varchar (100)
);

-- join table for treatment and medical_histories

CREATE TABLE medical_histories_treatment (
    treatment_id int,
    medical_histories int,
    PRIMARY KEY (treatment_id, medical_histories),
    CONSTRAINT fk_treatment FOREIGN KEY (treatment_id) REFERENCES treatment(id),
    CONSTRAINT fk_medical FOREIGN KEY (medical_histories) REFERENCES medical_histories(id)
);
