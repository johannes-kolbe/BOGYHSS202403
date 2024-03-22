sap.ui.define([
    "sap/m/MessageToast"
], function(MessageToast) {
    'use strict';

    return {
        upvote: function(oEvent) {
            MessageToast.show("Lernstoff wurde Geliked!.");
        }
    };
});
