$(document).ready(function(){  
    $('.collapsible').collapsible();
    $('.sidenav').sidenav();
    $('.parallax').parallax();
    $('.scrollspy').scrollSpy();
    $('.materialboxed').materialbox();
    $('#example').DataTable( {
        "ajax": "contenu/convertcsv.json",
        "columns": [
            { "data": "EntiteFinanciereProgramme" },
            { "data": "NomenclatureComptable" },
            { "data": "DEPENSES_RECETTES" },
            { "data": "INVESTISSEMENT_FONCTIONNEMENT" },
            { "data": "CodeChapitre" },
            { "data": "LibelleChapitre" },
            { "data": "CodeArticle" },
            { "data": "LibelleArticle" },
            { "data": "CodePresentationCroisee" },
            { "data": "LibellePresentationCroisee" },
            { "data": "ORDRE_REEL" },
            { "data": "MontantRealise" }
        ],
        dom: 'Bfrtip',
        buttons: [{
            extend: 'csv',
                filename: 'data.csv',
                text: 'Telechargr le CSV',
                exportOptions: {
                    modifier: {
                        search: 'none'
                    }
                }
        }],
        "pageLength": 10,
        responsive: true,
        "searching": false,
        "scrollCollapse": true,
        "scrollY":        "500px",
        "scrollX":        true,
        "language": {
            "paginate": {
                "first": "Premier",
                "last": "Dernier",
                "next": "Suivant",
                "previous": "Précédent"
            },
            "info": "Affichage de l'élément _START_ à _END_ sur _TOTAL_ éléments",
          },
          
    } );

});