<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0">

    <xsl:template match="/">
        <html>
            <head>
                <!-- If you disable JavaScript you cannot enter system and this disable events such as right click -->
                <script> document.addEventListener('contextmenu', event => event.preventDefault());
                </script>
                <style type="text/css">
                    table.tfmt {
                    border: 1px ;
                    }

                    td.colfmt {
                    border: 1px ;
                    background-color: white;
                    color: black;
                    text-align:left;
                    }

                    th {
                    background-color: blue;
                    color: white;
                    }
                    ::selection {
                    color: none;
                    background: none;
                    }


                </style>
                <style type="text/css" media="print">
                    * { display: none; }
                </style>

            </head>

            <body>

                <div id="page"
                     style="-moz-user-select: none; -webkit-user-select: none; -ms-user-select:none; user-select:none;-o-user-select:none;"
                     unselectable="on"
                     onselectstart="return false;"
                     onmousedown="return false;">

                    <table class="tfmt">
                        <tr>
                            <th style="width:250px">ManagerID:</th>
                            <th style="width:100px">Group:</th>
                            <th style="width:250px">username:</th>
                            <th style="width:100px">year:</th>
                            <th style="width:300px">Email:</th>

                        </tr>

                        <xsl:for-each select="ACCOUNTS/AC">

                            <tr>
                                <td class="colfmt">
                                    <xsl:value-of select="ManagerID" />
                                </td>
                                <td class="colfmt">
                                    <xsl:value-of select="Group" />
                                </td>

                                <td class="colfmt">
                                    <xsl:value-of select="username" />
                                </td>
                                <td class="colfmt">
                                    <xsl:value-of select="year" />
                                </td>
                                <td class="colfmt">
                                    <xsl:value-of select="email" />
                                </td>
                            </tr>

                        </xsl:for-each>
                    </table>

                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>