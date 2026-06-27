
using {sap.fe.showcase as persistence} from '../db/schema';
using {sap.common as common} from '../db/common';


service LROPODataService {

     entity RootEntities           as select from persistence.RootEntities
        actions {
            //Search-Terms: #BoundAction, #SideEffect
            @(
            //Update the UI after action
            Common.SideEffects: {TargetProperties: [
                'in/criticality_code',
                'in/fieldWithCriticality'
            ]})
            action changeCriticality(
                                     //Value Helper for the Input Parameter
                                     //Search-Term: #ValueHelpParameter
                                     @(
                                         title: '{i18n>newCriticality}',
                                         UI.ParameterDefaultValue: in.criticality_code,
                                         Common: {
                                             ValueListWithFixedValues: true,
                                             ValueList               : {
                                                 Label         : '{i18n>criticality}',
                                                 CollectionPath: 'Criticality',
                                                 Parameters    : [
                                                     {
                                                         $Type            : 'Common.ValueListParameterInOut',
                                                         ValueListProperty: 'code',
                                                         LocalDataProperty: newCriticality
                                                     },
                                                     {
                                                         $Type            : 'Common.ValueListParameterDisplayOnly',
                                                         ValueListProperty: 'name'
                                                     },
                                                 ]
                                             }
                                         }
                                     )
                                     newCriticality: Integer);

            //Search-Term: #BoundAction
            action changeProgress(
                                  @(
                                      title: '{i18n>newProgress}',
                                      UI.ParameterDefaultValue: 50
                                  )
                                  newProgress: Integer);

            @(
            //Update the UI after action
            Common.SideEffects: {TargetEntities: [in]})
            action resetEntities(in: many $self);
        };


}