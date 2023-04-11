import { LightningElement } from 'lwc';
import getAssignments from './getAssignments';

const columns = [
    { label: 'Project name', fieldName: 'Project__c' },
    { label: 'Website', fieldName: 'Name', type: 'text' },
    { label: 'Created Date', fieldName: 'CreatedDate', type: 'date' }
];

export default class DeveloperListAsign extends LightningElement {
    data = [];
    columns = columns;

    connectedCallback() {
        const data = getAssignments();
        this.data = data;
    }
}