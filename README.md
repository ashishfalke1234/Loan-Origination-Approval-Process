# TCS Lastmile Project: Loan Origination & Approval System

This repository contains the source code and metadata for a comprehensive Loan Origination and Approval Management System built on the Salesforce Platform. The project was developed as part of the TCS Lastmile program and demonstrates a full range of Salesforce admin and developer skills.

## 1. Project Overview

The system is designed to automate and streamline the entire loan lifecycle for a financial institution, replacing a manual process of spreadsheets and emails with a robust, secure, and transparent application.

**Core Features:**
- **Data Model:** A self-contained `Loan Application` object with custom fields to track all necessary information.
- **Data Integrity:** Validation Rules to enforce business policies like minimum credit score and salary.
- **Automated EMI Calculation:** An Apex Trigger that automatically calculates the Estimated Monthly Installment (EMI).
- **UI/UX:** A dedicated "Loan Processing" Lightning App with a clean page layout and a visual Path.
- **Complex Approval Workflow:** A multi-step approval process that routes applications to the correct teams (Queues).
- **Integration:** A Lightning Web Component (LWC) that simulates a callout to an external credit bureau.
- **Post-Approval Automation:** A Record-Triggered Flow that automatically creates a task for the disbursal team.
- **Analytics:** A real-time Report and Dashboard for management to track the loan pipeline.

## 2. Technical Components

This project utilizes a wide range of Salesforce technologies:

- **Admin:** Custom Objects, Fields, Page Layouts, Lightning App Builder, Validation Rules, Approval Processes, Flow Builder, Reports & Dashboards.
- **Developer:** Apex (Classes, Triggers, Test Classes), SOQL, Lightning Web Components (HTML, JS), Apex Callouts (REST).
- **Tools:** VS Code, Salesforce CLI (SFDX), Git & GitHub, Data Loader.