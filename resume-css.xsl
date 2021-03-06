<?xml version="1.0"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:template name="stylesheet">
    <style>
      body {
        background: #fff;
        color: #000;
        font-family: times new roman, serif;
        margin: 0.5in 1in 1in 1in;
      }

      h2 {
        text-align: center;
        margin: 0px 0px 0px 0px;
      }

      h3 {
        border-top: solid black 2px;
        text-transform: uppercase;
        padding-top: 1em;
        font-size: 13pt;
      }
      h3:first-child {
        border: none;
      }

      h4 {
        text-transform: uppercase;
      }

      a {
        text-decoration: none;
        font-weight: bold;
        color: black
      }
      a:hover {
        text-decoration: underline;
      }

      header {
        width: 71%;
      }

      main {
        width: 71%;
        float: left;
      }

      .contact {
        background: #efefef;
        border: solid black 2px;
        font-size: 12pt;
        padding: 2px;
        width: 17em;
        /* The margins center the box itself */
        margin-left: auto;
        margin-right: auto;
        text-align: center;
      }
      .contact a {
        font-weight: normal;
        white-space: nowrap;
      }
      .contact label {
        font-style: italic;
      }

      .site {
        margin-right: 1em;
      }
      .site .logo {
        width: 1em;
        height: 1em;
        margin-bottom: -0.2em;
        margin-right: 0.125em;
      }

      .exec-summary {
        margin-top: 1em;
      }

      .job {
        margin-top: 1em;
        margin-bottom: 1em;
        border-bottom: solid black 2px;
      }
      .job:last-child {
        border-bottom: none;
      }
      .job .company {
        text-decoration: underline;
        left: 1in;
        position: absolute;
      }
      .job .summary {
        min-width: 450px;
      }
      .job .logo {
        max-height: 3em;
        margin-left: 0.5em;
        float: right;
      }
      .job .dates {
        float: left;
        position: relative;
        left: 16em;
      }
      .job .titles {
        margin-left: 2em;
      }

      .reference {
        float: left;
        margin-top: 0px;
        padding-right: 30px;
        max-width: 250px;
      }

      .sidebar {
        position: relative;
        margin-top: -2in;
        float: right;
        width: 26%;
        border-left: solid black 2px;
        margin-left: 1%;
        padding-left: 1%;
        margin-right: 0;
        font-size: 12pt;
      }
      .sidebar h3 {
        border-top: none;
        font-size: 13pt;
      }
      .sidebar h3:first-child {
        padding-top: 0;
        margin-top: 0;
      }

      /* These are the Video and Slide links that only show up on screens */
      .quick-link {
        float: right;
      }
      .quick-link a {
        border: solid 1px black;
        background: #efefef;
        padding-left: 0.2em;
        padding-right: 0.2em;
        margin-right: 0.4em;
      }
      /* And this is the URL linking text that only shows up printed */
      .url-text {
        display: none;
      }

      .skills, .quotes {
        margin-bottom: 1em;
      }

      article {
        border-bottom: dashed black 1px;
        padding-bottom: .5em;
        margin-bottom: .5em;
        page-break-inside: avoid;
      }
      .portfolio article:last-child {
        border: none;
      }

      img.lang {
        max-height: 1.1em;
        margin-right: 0.25em;
        margin-left: 0.25em;
        float: right;
      }

      .full .label {
        float: left;
      }
      .full img.lang {
        float: none;
        left: 55em;
        position: absolute;
      }

      /* Moving the dates above the company name when we don't have enough space to do side-by-side*/
      @media screen and (max-width: 1340px) {
        .job .dates {
          float: none;
          left: 0;
        }
      }

      /* On even smaller windows, make the company logos smaller */
      @media screen and (max-width: 1030px) {
        .job .logo {
          max-height: 1.5em;
          margin-left: 0.25em;
        }
        .full img.lang {
          float: none;
          margin-left: 1em;
          left: 0;
          position: relative;
        }
      }

      /* At this point, we just move the sidebar to the bottom */
      @media screen and (max-width: 830px) {
        body {
          margin: 0.125in 0.25in 0.25in 0.25in;
        }
        .job .company {
          left: 0.25in; /* to match margin */
        }
        main {
          width: 100%;
        }
        .sidebar {
          position: relative;
          margin-top: 0;
          float: none;
          width: 100%; 
          border-left: none;
          padding-left: 0;
          margin-left: 0;
          font-size: 12pt;
        }
      }

      /* And finally just hide the logos entirely */
      @media screen and (max-width: 510px) {
        .job .logo {
          display: none;
        }
      }

      /* For printing... */
      @page {
        size: auto;
        margin: 0.25in 0.25in 0.25in 0.25in;
      }
      @media print {
        /* No margin on the body tag as we have it on @page */
        body {
          margin: 0;
          font-size: 95%;
        }
        .job .company {
          left: 0; /* to match margin */
        }
        /* hide the clickable buttons */
        .quick-link {
          display: none;
        }
        /* show the link text */
        .url-text {
          display: block;
        }
        .url-text a {
          font-size: 8pt;
          font-weight: normal;
        }

        /* dates above job entries */
        .job .dates {
          float: none;
          left: 0;
        }

        /* a little less whitespace for the sidebar, a little smaller text */
        .sidebar {
          margin-left: 0.6em;
          padding-left: 0.6em;
          font-size: 11pt;
        }
        .sidebar h3 {
          font-size: 12pt;
        }

        /* hide details of ancient jobs when printing */
        .ancient {
          display: none;
        }
      }
    </style>
  </xsl:template>
</xsl:stylesheet>
