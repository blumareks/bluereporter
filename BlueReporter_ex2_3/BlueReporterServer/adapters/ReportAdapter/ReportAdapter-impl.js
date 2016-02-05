/*
 *  Licensed Materials - Property of IBM
 *  5725-I43 (C) Copyright IBM Corp. 2011, 2013. All Rights Reserved.
 *  US Government Users Restricted Rights - Use, duplication or
 *  disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
 */

function postReport(dataWrapper) {
var wrapData = {
    docs:[dataWrapper]
    }
    
    var input = {
        method : 'post',
        returnedContentType : 'json',
        path : "/report_db/_bulk_docs",
        body : {
            contentType : 'application/json',
            content : JSON.stringify( wrapData )
        }
    };
    return WL.Server.invokeHttp(input);


}


