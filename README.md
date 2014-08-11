DbScriptomate
=============

Automated SQL Server database change deployments and versioning.

What does it do?
----------------
In short, it lets you:
* Manage DB alterations an a controlled and repeatable way.
* Version databases with your source code.
* Propagate these DB versions to development team members running local databases.
* Automate testing, staging and production deployments with your Continuous Integration or Deployment server.

What will it ask of you?
------------------------
All changes to your database should happen through TSQL scripts. Either you have to generate them using SSMS or some other tool, or you should write them by hand. For the most part, we have found that writing them by hand works the best for alterations to existing DB objects, such as adding columns or changing constraints or indexes, etc.
The only time we generate scripts is for new objects, as when we add one or more tables. In that case we usually design them in a diagram, and generate create scripts for them afterward.
Either way, you need to end up with a script.
You cannot mix DML and DDL in the same batch, so DbScriptomate expects only one of the 2 in a given script file.
You will copy the content of your scripts into the script files that DbScriptomate generates for you off predefined templates.

The templates are written in such a way that each script file is transactional, and has the same semantics whether it is executed manually through SSMS, or automatically by DbScriptomate. Either way, it will rollback if the script file could not be fully applied, and if successful, it will log the fact that the script was applied to the DB so that the same script will not ever be attempted again on the same DB. (That's cool, in case you didn't realise)

Why does it exist?
------------------
We were running in an environment where we make extensive use of SQL Merge Replication. For those who have tried this, you will know that replication puts a number of additional constraints on what you can do to a database.
We haven't found an existing tool that fit our needs. (I'm not going to recap all the reasons here or tools we investigated)