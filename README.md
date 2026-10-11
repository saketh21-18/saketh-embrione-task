

# Embrione — Team Management Platform

A web-based team management platform that allows students to register their profiles, submit personal and professional information, and become part of a team directory after administrator approval.

<p align="center">
  <a href="https://saketh-embrione-task.vercel.app">
    <strong>🌐 Live Website</strong>
  </a>
  &nbsp; | &nbsp;
  <a href="https://github.com/saketh21-18/saketh-embrione-task">
    <strong>💻 GitHub Repository</strong>
  </a>
</p>

---

## Table of Contents

- [Overview](#overview)
- [Live Demo](#live-demo)
- [Features](#features)
- [How It Works](#how-it-works)
- [Application Pages](#application-pages)
- [Technology Stack](#technology-stack)
- [Project Structure](#project-structure)
- [Getting Started](#getting-started)
- [Environment Configuration](#environment-configuration)
- [Supabase Setup](#supabase-setup)
- [How to Use](#how-to-use)
- [Database and Image Storage](#database-and-image-storage)
- [Deployment](#deployment)
- [Troubleshooting](#troubleshooting)
- [Security Considerations](#security-considerations)
- [Future Improvements](#future-improvements)
- [Developer](#developer)

---

## Overview

Embrione is a web-based team management platform designed to simplify member registration, application reviews, and team directory management.

The platform provides a structured registration form for collecting student information and a centralized dashboard for managing submitted applications.

New registrations remain pending until an administrator reviews them. Approved members can then appear in the team directory, where visitors can explore profiles and filter members by domain or position.

The project combines a modern user interface with database integration, image processing, cloud storage, and deployment.

## Live Demo

- **Live Website:** [Embrione](https://saketh-embrione-task.vercel.app)
- **GitHub Repository:** [saketh21-18/saketh-embrione-task](https://github.com/saketh21-18/saketh-embrione-task)

### Application Routes

| Page | Route | Purpose |
|---|---|---|
| Team Directory | `/team` | Browse approved members |
| Registration | `/register` | Submit a member application |
| Admin Dashboard | `/admin` | Review and manage applications |

## Features

### Student Registration
- Register through a structured application form.
- Submit personal, academic, and professional information.
- Provide SRN, email, branch, semester, and domain details.
- Add a short biography.
- Include LinkedIn and GitHub profile links.
- Upload a profile photograph.

### Image Processing
- Convert uploaded images into WebP format in the browser.
- Resize images to a maximum width of 800 pixels while preserving their aspect ratio.
- Compress converted images using a quality setting of 0.8.
- Upload processed images to Supabase Storage.
- Generate a default avatar when no photograph is provided.

### Team Directory
- Display approved member profiles.
- Organize profiles by domain and position.
- Filter members to make profile discovery easier.

### Admin Dashboard
- View submitted applications.
- Review pending registrations.
- Approve or reject applications.
- Remove member records through the available management controls.

### Database and Deployment
- Store member information in Supabase.
- Use Supabase Storage for profile photographs.
- Configure environment variables for deployment.
- Deploy the application using Vercel.
- Maintain source code using Git and GitHub.

## How It Works

The platform follows a registration, review, and publication workflow.

```mermaid
flowchart TD
    A[Student opens website] --> B[Registration Form]
    B --> C[Enter personal and academic details]
    C --> D{Photo provided?}
    D -->|Yes| E[Convert image to WebP]
    E --> F[Upload image to Supabase Storage]
    D -->|No| G[Generate default avatar]
    F --> H[Submit member information]
    G --> H
    H --> I[Save application in Supabase]
    I --> J[Pending Review]
    J --> K[Admin Dashboard]
    K --> L{Admin Decision}
    L -->|Approve| M[Approved Member]
    L -->|Reject| N[Rejected Application]
    M --> O[Team Directory]
````

### Workflow Explanation

1. A student opens the registration page.
2. The student completes the application form.
3. If a photograph is selected, the browser converts it to WebP format.
4. The processed image is uploaded to the `member-photos` Supabase Storage bucket.
5. The application submits the member information to the database.
6. The registration enters the review workflow.
7. An administrator reviews the application.
8. Approved profiles become eligible to appear in the team directory.

**Note:** Image uploads require correctly configured Supabase Storage permissions. Registration without a photo does not confirm that image uploads are working.

## Application Pages

### 1. Team Directory — `/team`

The team directory provides a central place to explore approved member profiles.

Users can:

* Browse approved members.
* View profile information.
* Explore members by domain.
* Filter members by position.

Only approved profiles are intended to appear in the directory.

### 2. Registration — `/register`

The registration page collects information needed to create a member profile.

Typical fields include:

* Full name
* Domain
* Position
* SRN
* Email address
* LinkedIn profile
* GitHub profile
* Branch
* Semester
* Short biography
* Profile photograph

The application validates the form and submits the registration through the configured data layer.

### 3. Admin Dashboard — `/admin`

The administrative interface provides controls for reviewing registrations.

Available operations include:

* Viewing submitted applications.
* Reviewing pending registrations.
* Approving applications.
* Rejecting applications.
* Removing member records.

Administrative access and database permissions should be secured before the application is used with real student information.

## Technology Stack

| Technology       | Purpose                                         |
| ---------------- | ----------------------------------------------- |
| React            | Component-based user interface                  |
| Vite             | Development server and production build tooling |
| JavaScript       | Application logic and interactions              |
| HTML             | Page structure                                  |
| CSS              | Styling and layout                              |
| Supabase         | Database and backend services                   |
| Supabase Storage | Profile image storage                           |
| Canvas API       | Client-side image resizing and conversion       |
| Vercel           | Website deployment                              |
| Git and GitHub   | Version control and source code hosting         |

## Project Structure

The main project files are organized as follows:

```text
embrione-task/
├── public/
├── src/
│   └── ...
├── static/
│   └── ...
├── App.jsx
├── package.json
├── index.html
├── supabase-setup.sql
├── .gitignore
├── .env.example
└── README.md
```

The exact structure may differ depending on the files in the repository.

### Important Files

* `App.jsx` — Contains the main application interface, registration workflow, team directory, and administrative functionality.
* `package.json` — Defines project dependencies and npm scripts.
* `supabase-setup.sql` — Contains SQL setup instructions for the database and related configuration.
* `.env.example` — Documents required environment variables, if included.
* `.gitignore` — Excludes generated files and local environment configuration from Git.

## Getting Started

### Prerequisites

Install the following tools:

* [Node.js](https://nodejs.org/)
* [npm](https://docs.npmjs.com/)
* [Git](https://git-scm.com/)
* [Supabase](https://supabase.com/) account for backend functionality

### Step 1: Clone the Repository

```bash
git clone https://github.com/saketh21-18/saketh-embrione-task.git
```

### Step 2: Open the Project

```bash
cd saketh-embrione-task
```

If the Vite application is inside a subdirectory, navigate into that directory before continuing.

### Step 3: Install Dependencies

```bash
npm install
```

### Step 4: Configure Environment Variables

Create a `.env.local` file in the Vite application's root directory.

Add the following variables:

```env
VITE_SUPABASE_URL=your_supabase_project_url
VITE_SUPABASE_PUBLISHABLE_KEY=your_supabase_publishable_key
```

Replace the example values with your own Supabase project URL and publishable key.

Never commit `.env.local` to GitHub.

### Step 5: Start the Development Server

```bash
npm run dev
```

Open the local URL displayed in the terminal, usually:

```text
http://localhost:5173
```

### Step 6: Create a Production Build

```bash
npm run build
```

Vite generates the production build in the `dist` directory when the build completes successfully.

To preview the production build locally:

```bash
npm run preview
```

## Environment Configuration

The application uses Vite environment variables to connect to Supabase.

| Variable                        | Purpose                                         |
| ------------------------------- | ----------------------------------------------- |
| `VITE_SUPABASE_URL`             | Identifies the Supabase project                 |
| `VITE_SUPABASE_PUBLISHABLE_KEY` | Initializes the Supabase client in the frontend |

### Local Configuration

Create a `.env.local` file in the application root:

```env
VITE_SUPABASE_URL=your_supabase_project_url
VITE_SUPABASE_PUBLISHABLE_KEY=your_supabase_publishable_key
```

Restart the development server after changing environment variables.

### Vercel Configuration

1. Open the project in Vercel.
2. Navigate to **Settings → Environment Variables**.
3. Add `VITE_SUPABASE_URL`.
4. Add `VITE_SUPABASE_PUBLISHABLE_KEY`.
5. Enable the appropriate environment, such as Production.
6. Save the variables.
7. Redeploy the application.

Never expose a Supabase service-role key or database password through a `VITE_` environment variable.

## Supabase Setup

Supabase provides the database and image storage used by the application.

### Step 1: Create a Project

Create a project through the [Supabase Dashboard](https://supabase.com/dashboard).

### Step 2: Configure the Database

Open the SQL Editor in your Supabase project.

Review the SQL statements in [`supabase-setup.sql`](./supabase-setup.sql) and execute the required setup statements.

The application uses a member table named:

```text
public.members
```

The table stores member information and application status.

### Step 3: Configure Storage

Create a Storage bucket with the exact name:

```text
member-photos
```

The application uploads processed photographs to this bucket.

The current implementation uses a public bucket so profile image URLs can be displayed by the website.

### Step 4: Configure Storage Permissions

The image-upload process requires an appropriate Storage `INSERT` policy.

The current configuration includes a policy named:

```text
Allow registration photo uploads
```

It allows the `anon` and `authenticated` roles to insert objects when the bucket ID matches `member-photos`.

The policy condition is:

```sql
(bucket_id = 'member-photos'::text)
```

Confirm that the policy is present and correctly configured in your Supabase project.

A public bucket does not automatically grant permission to upload files.

### Step 5: Configure Database Permissions

The application requires appropriate database permissions for registration, reading member profiles, and administrative operations.

Review the policies associated with `public.members` before enabling public access.

Use Row Level Security (RLS) to protect student information and prevent unauthorized modifications.

## How to Use

### Register as a Member

1. Open the [live website](https://saketh-embrione-task.vercel.app).
2. Navigate to `/register`.
3. Complete the registration form.
4. Add your academic and professional information.
5. Optionally select a profile photograph.
6. Submit the application.
7. Check for the registration confirmation message.

When a photograph is selected, the browser processes the image before attempting to upload it to Supabase Storage.

### Review an Application

1. Navigate to `/admin`.
2. Sign in using the configured administrative access.
3. Open the submitted applications.
4. Review a pending profile.
5. Approve or reject the application using the available controls.

Administrative credentials should be shared securely with authorized reviewers rather than published in this README.

### View Approved Members

1. Navigate to `/team`.
2. Browse the available profiles.
3. Use the domain or position filters.
4. View the displayed member information.

Only approved profiles should be visible in the public directory.

## Database and Image Storage

### Member Records

Member information is stored in:

```text
public.members
```

The registration form includes fields such as:

* `name`
* `domain`
* `position`
* `srn`
* `email`
* `linkedin_url`
* `github_url`
* `branch`
* `semester`
* `bio`
* `photo_url`

The application also uses an approval status to distinguish profiles at different stages of review. Check the exact column names and allowed status values in `supabase-setup.sql` and the application code.

### Image Upload Process

When a photograph is selected:

1. The browser reads the original image.
2. A canvas resizes it if its width exceeds 800 pixels.
3. The browser converts it to WebP format using a quality setting of 0.8.
4. The application uploads the WebP file to `member-photos`.
5. Supabase provides a public image URL.
6. The application saves the URL with the member information.

Uploaded filenames are generated using a timestamp and a sanitized version of the SRN.

When no photograph is selected, the application generates a default avatar URL.

### Important Upload Detail

The current registration flow uploads the photograph before inserting the member record.

If the image upload fails, registration can stop before the database insert occurs. This can explain why registration succeeds without a photo but fails when a photo is attached.

## Deployment

The application is deployed using Vercel and connected to GitHub.

### Deployment Links

* **Live Application:** [Embrione](https://saketh-embrione-task.vercel.app)
* **Source Code:** [GitHub Repository](https://github.com/saketh21-18/saketh-embrione-task)
* **Vercel Dashboard:** [Vercel](https://vercel.com/dashboard)
* **Supabase Dashboard:** [Supabase](https://supabase.com/dashboard)

### Deployment Workflow

1. Push updated code to GitHub.
2. Confirm that Vercel is connected to the correct repository.
3. Configure the required environment variables.
4. Run a production build to check for errors.
5. Deploy the application.
6. Test registration, the team directory, and the administrative pages.
7. Verify that database operations and photo uploads work in the deployed environment.

After changing environment variables, redeploy the application so the production build uses the updated configuration.

## Troubleshooting

### Registration Works Without a Photo but Fails With One

**Possible cause:** The image upload is failing before the member record is inserted.

Check the following:

* The `member-photos` bucket exists.
* The bucket ID matches the ID used in the application.
* The Storage `INSERT` policy applies to the correct roles.
* The policy condition matches `member-photos`.
* The browser's Network tab contains the response from the failed upload request.

A public bucket alone does not grant upload permission.

### Error: `new row violates row-level security policy`

This error indicates that a database or Storage operation was rejected by an RLS policy.

To investigate:

1. Open the browser's Developer Tools.
2. Select the Network tab.
3. Reproduce the failing operation.
4. Find the failed request.
5. Open its Response tab.
6. Identify whether the failure occurred during the Storage upload or database insertion.

Inspect the relevant RLS policies before modifying permissions. Avoid creating duplicate policies or granting unrestricted access as a workaround.

### Member Does Not Appear in the Team Directory

Check whether:

* The registration was successfully saved.
* The member's approval status is correct.
* The team page filters for the expected approved status.
* The application can read the relevant member record.
* The deployed environment has the correct Supabase configuration.

### Supabase Environment Variables Are Missing

Check the variable names carefully:

```text
VITE_SUPABASE_URL
VITE_SUPABASE_PUBLISHABLE_KEY
```

Ensure they are configured for the relevant Vercel environment and that the latest deployment includes them.

### Local Development Works but the Deployed Website Does Not

Check the production environment variables, Supabase RLS policies, browser Console, and Network responses. Local development and production may use different environment configurations.

## Security Considerations

Before using this application with real student information, consider the following improvements:

* Enforce Row Level Security on member records and Storage objects.
* Protect administrative actions with server-side authorization.
* Do not rely on frontend-only login checks to protect administrative functionality.
* Restrict access to personal information, including SRNs and email addresses.
* Validate registration data through trusted backend logic.
* Apply appropriate upload size and file-type restrictions.
* Prevent unauthorized users from approving, rejecting, or deleting records.
* Keep service-role credentials and database passwords out of frontend code and public repositories.

A Supabase publishable key is intended for client-side use, but database and Storage policies must still enforce appropriate permissions.

## Future Improvements

Potential improvements include:

* Secure server-side administrative authentication.
* Stronger form validation and clearer error messages.
* Reliable duplicate-registration prevention.
* Search and sorting in the team directory.
* Pagination for larger directories.
* Upload progress indicators and improved error handling.
* Automated tests.
* Better mobile responsiveness and accessibility.
* Automated deployment checks.
* Audit logs for administrative decisions.

## Developer

**Naga Saketh Sarma R**

BTech Student | Web Development | Software Projects

* **GitHub:** [saketh21-18](https://github.com/saketh21-18)
* **Project Repository:** [saketh-embrione-task](https://github.com/saketh21-18/saketh-embrione-task)
* **Live Website:** [Embrione](https://saketh-embrione-task.vercel.app)

---

*Built to explore practical frontend development, database integration, image processing, application workflows, and deployment.*

```

**One final thing, bro:** The README no longer mentions a recruitment challenge. Before submitting the repository, verify that the photo-upload feature works correctly, because we've confirmed registration works without a photo but haven't yet resolved the upload issue.
```
