-- CreateTable
CREATE TABLE "lookup_company_types" (
    "company_type_id" SERIAL NOT NULL,
    "type_name" VARCHAR(100) NOT NULL,

    CONSTRAINT "lookup_company_types_pkey" PRIMARY KEY ("company_type_id")
);

-- CreateTable
CREATE TABLE "lookup_expertise_types" (
    "expertise_type_id" SERIAL NOT NULL,
    "type_name" VARCHAR(100) NOT NULL,

    CONSTRAINT "lookup_expertise_types_pkey" PRIMARY KEY ("expertise_type_id")
);

-- CreateTable
CREATE TABLE "lookup_service_periods" (
    "service_period_id" SERIAL NOT NULL,
    "period_name" VARCHAR(50) NOT NULL,

    CONSTRAINT "lookup_service_periods_pkey" PRIMARY KEY ("service_period_id")
);

-- CreateTable
CREATE TABLE "lookup_contract_types" (
    "contract_type_id" SERIAL NOT NULL,
    "type_name" VARCHAR(100) NOT NULL,

    CONSTRAINT "lookup_contract_types_pkey" PRIMARY KEY ("contract_type_id")
);

-- CreateTable
CREATE TABLE "lookup_states" (
    "state_id" SERIAL NOT NULL,
    "state_name" VARCHAR(100) NOT NULL,

    CONSTRAINT "lookup_states_pkey" PRIMARY KEY ("state_id")
);

-- CreateTable
CREATE TABLE "lookup_contact_modes" (
    "contact_mode_id" SERIAL NOT NULL,
    "mode_name" VARCHAR(50) NOT NULL,

    CONSTRAINT "lookup_contact_modes_pkey" PRIMARY KEY ("contact_mode_id")
);

-- CreateTable
CREATE TABLE "lookup_document_types" (
    "document_type_id" SERIAL NOT NULL,
    "type_name" VARCHAR(100) NOT NULL,

    CONSTRAINT "lookup_document_types_pkey" PRIMARY KEY ("document_type_id")
);

-- CreateTable
CREATE TABLE "lookup_manufacturers" (
    "manufacturer_id" SERIAL NOT NULL,
    "manufacturer_name" VARCHAR(100) NOT NULL,

    CONSTRAINT "lookup_manufacturers_pkey" PRIMARY KEY ("manufacturer_id")
);

-- CreateTable
CREATE TABLE "lookup_unit_types" (
    "unit_type_id" SERIAL NOT NULL,
    "type_name" VARCHAR(100) NOT NULL,

    CONSTRAINT "lookup_unit_types_pkey" PRIMARY KEY ("unit_type_id")
);

-- CreateTable
CREATE TABLE "lookup_countries" (
    "country_id" SERIAL NOT NULL,
    "country_name" VARCHAR(100) NOT NULL,

    CONSTRAINT "lookup_countries_pkey" PRIMARY KEY ("country_id")
);

-- CreateTable
CREATE TABLE "organizations" (
    "organization_id" SERIAL NOT NULL,
    "company_name" VARCHAR(255) NOT NULL,
    "company_type_id" INTEGER NOT NULL,
    "expertise_type_id" INTEGER NOT NULL,
    "num_techs" INTEGER NOT NULL,
    "num_certified_techs" INTEGER NOT NULL,
    "num_vehicles" INTEGER NOT NULL,
    "service_periods_id" INTEGER NOT NULL,
    "contract_type_id" INTEGER NOT NULL,
    "num_accidents" INTEGER NOT NULL,
    "num_incidents" INTEGER NOT NULL,
    "num_claims" INTEGER NOT NULL,
    "num_legal_cases" INTEGER NOT NULL,
    "annual_turnover" DECIMAL(18,2) NOT NULL,
    "year_established" INTEGER NOT NULL,
    "head_of_operations_name" VARCHAR(255) NOT NULL,
    "construct_manager_name" VARCHAR(255) NOT NULL,
    "proj_manager_name" VARCHAR(255) NOT NULL,
    "service_manager_name" VARCHAR(255) NOT NULL,
    "engg_manager_name" VARCHAR(255) NOT NULL,
    "sales_manager_name" VARCHAR(255) NOT NULL,
    "office_address_line1" VARCHAR(255) NOT NULL,
    "office_address_line2" VARCHAR(255),
    "office_pin_code" VARCHAR(20) NOT NULL,
    "office_state_id" INTEGER NOT NULL,
    "office_area" VARCHAR(100) NOT NULL,
    "contact_number" VARCHAR(50) NOT NULL,
    "preferred_mode_of_contact_id" INTEGER NOT NULL,
    "registration_timestamp" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "organizations_pkey" PRIMARY KEY ("organization_id")
);

-- CreateTable
CREATE TABLE "locations" (
    "location_id" SERIAL NOT NULL,
    "address_line1" VARCHAR(255) NOT NULL,
    "address_line2" VARCHAR(255),
    "zip_code" VARCHAR(20) NOT NULL,
    "state_id" INTEGER NOT NULL,
    "area" VARCHAR(100) NOT NULL,
    "contact_number" VARCHAR(50) NOT NULL,
    "preferred_mode_of_contact_id" INTEGER NOT NULL,

    CONSTRAINT "locations_pkey" PRIMARY KEY ("location_id")
);

-- CreateTable
CREATE TABLE "units" (
    "unit_id" SERIAL NOT NULL,
    "organization_id" INTEGER NOT NULL,
    "location_id" INTEGER NOT NULL,
    "manufacturer_id" INTEGER NOT NULL,
    "unit_type_id" INTEGER NOT NULL,
    "contract_type_id" INTEGER NOT NULL,
    "num_landing_doors" INTEGER NOT NULL,
    "num_cabin_doors" INTEGER NOT NULL,
    "num_floors" INTEGER NOT NULL,
    "cabin_width_mm" DECIMAL(10,2) NOT NULL,
    "cabin_height_mm" DECIMAL(10,2) NOT NULL,
    "cabin_depth_mm" DECIMAL(10,2) NOT NULL,
    "shaft_width_mm" DECIMAL(10,2) NOT NULL,
    "shaft_height_mm" DECIMAL(10,2) NOT NULL,
    "shaft_depth_mm" DECIMAL(10,2) NOT NULL,
    "pit_mm" DECIMAL(10,2) NOT NULL,
    "installation_submission_timestamp" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "units_pkey" PRIMARY KEY ("unit_id")
);

-- CreateTable
CREATE TABLE "documents" (
    "document_id" SERIAL NOT NULL,
    "organization_id" INTEGER,
    "unit_id" INTEGER,
    "document_type_id" INTEGER NOT NULL,
    "file_name" VARCHAR(255) NOT NULL,
    "file_path" VARCHAR(512) NOT NULL,
    "upload_timestamp" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "documents_pkey" PRIMARY KEY ("document_id")
);

-- CreateTable
CREATE TABLE "service_requests" (
    "service_request_id" SERIAL NOT NULL,
    "organization_id" INTEGER NOT NULL,
    "unit_id" INTEGER NOT NULL,
    "service_period_id" INTEGER NOT NULL,
    "request_contact_number" VARCHAR(50) NOT NULL,
    "request_contact_mode_id" INTEGER NOT NULL,
    "problem_description" TEXT NOT NULL,
    "request_timestamp" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "service_requests_pkey" PRIMARY KEY ("service_request_id")
);

-- CreateTable
CREATE TABLE "spare_part_requests" (
    "spare_part_request_id" SERIAL NOT NULL,
    "email" VARCHAR(255) NOT NULL,
    "part_number" VARCHAR(100) NOT NULL,
    "description" TEXT NOT NULL,
    "quantity" INTEGER NOT NULL,
    "manufacturer_id" INTEGER NOT NULL,
    "country_id" INTEGER NOT NULL,
    "request_timestamp" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "spare_part_requests_pkey" PRIMARY KEY ("spare_part_request_id")
);

-- CreateTable
CREATE TABLE "contact_queries" (
    "contact_id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "email" VARCHAR(255) NOT NULL,
    "business_or_job_field" VARCHAR(255) NOT NULL,
    "query_text" TEXT NOT NULL,
    "submission_timestamp" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "contact_queries_pkey" PRIMARY KEY ("contact_id")
);

-- AddForeignKey
ALTER TABLE "organizations" ADD CONSTRAINT "organizations_company_type_id_fkey" FOREIGN KEY ("company_type_id") REFERENCES "lookup_company_types"("company_type_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "organizations" ADD CONSTRAINT "organizations_contract_type_id_fkey" FOREIGN KEY ("contract_type_id") REFERENCES "lookup_contract_types"("contract_type_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "organizations" ADD CONSTRAINT "organizations_expertise_type_id_fkey" FOREIGN KEY ("expertise_type_id") REFERENCES "lookup_expertise_types"("expertise_type_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "organizations" ADD CONSTRAINT "organizations_office_state_id_fkey" FOREIGN KEY ("office_state_id") REFERENCES "lookup_states"("state_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "organizations" ADD CONSTRAINT "organizations_preferred_mode_of_contact_id_fkey" FOREIGN KEY ("preferred_mode_of_contact_id") REFERENCES "lookup_contact_modes"("contact_mode_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "organizations" ADD CONSTRAINT "organizations_service_periods_id_fkey" FOREIGN KEY ("service_periods_id") REFERENCES "lookup_service_periods"("service_period_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "locations" ADD CONSTRAINT "locations_preferred_mode_of_contact_id_fkey" FOREIGN KEY ("preferred_mode_of_contact_id") REFERENCES "lookup_contact_modes"("contact_mode_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "locations" ADD CONSTRAINT "locations_state_id_fkey" FOREIGN KEY ("state_id") REFERENCES "lookup_states"("state_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "units" ADD CONSTRAINT "units_contract_type_id_fkey" FOREIGN KEY ("contract_type_id") REFERENCES "lookup_contract_types"("contract_type_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "units" ADD CONSTRAINT "units_location_id_fkey" FOREIGN KEY ("location_id") REFERENCES "locations"("location_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "units" ADD CONSTRAINT "units_manufacturer_id_fkey" FOREIGN KEY ("manufacturer_id") REFERENCES "lookup_manufacturers"("manufacturer_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "units" ADD CONSTRAINT "units_organization_id_fkey" FOREIGN KEY ("organization_id") REFERENCES "organizations"("organization_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "units" ADD CONSTRAINT "units_unit_type_id_fkey" FOREIGN KEY ("unit_type_id") REFERENCES "lookup_unit_types"("unit_type_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "documents" ADD CONSTRAINT "documents_document_type_id_fkey" FOREIGN KEY ("document_type_id") REFERENCES "lookup_document_types"("document_type_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "documents" ADD CONSTRAINT "documents_organization_id_fkey" FOREIGN KEY ("organization_id") REFERENCES "organizations"("organization_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "documents" ADD CONSTRAINT "documents_unit_id_fkey" FOREIGN KEY ("unit_id") REFERENCES "units"("unit_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "service_requests" ADD CONSTRAINT "service_requests_organization_id_fkey" FOREIGN KEY ("organization_id") REFERENCES "organizations"("organization_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "service_requests" ADD CONSTRAINT "service_requests_request_contact_mode_id_fkey" FOREIGN KEY ("request_contact_mode_id") REFERENCES "lookup_contact_modes"("contact_mode_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "service_requests" ADD CONSTRAINT "service_requests_service_period_id_fkey" FOREIGN KEY ("service_period_id") REFERENCES "lookup_service_periods"("service_period_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "service_requests" ADD CONSTRAINT "service_requests_unit_id_fkey" FOREIGN KEY ("unit_id") REFERENCES "units"("unit_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "spare_part_requests" ADD CONSTRAINT "spare_part_requests_country_id_fkey" FOREIGN KEY ("country_id") REFERENCES "lookup_countries"("country_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "spare_part_requests" ADD CONSTRAINT "spare_part_requests_manufacturer_id_fkey" FOREIGN KEY ("manufacturer_id") REFERENCES "lookup_manufacturers"("manufacturer_id") ON DELETE RESTRICT ON UPDATE CASCADE;

