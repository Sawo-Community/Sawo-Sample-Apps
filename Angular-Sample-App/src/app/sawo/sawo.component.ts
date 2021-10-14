import { Component, OnInit } from '@angular/core';
import Sawo from 'sawo';

@Component({
  selector: 'app-sawo',
  templateUrl: './sawo.component.html',
  styleUrls: ['./sawo.component.css'],
})
export class SawoComponent implements OnInit {
  title = 'angular-sawo-chander';
  Sawo: any;
  isLoggedIn: boolean = false;
  userPayload: any = {};

  constructor() {}

  ngOnInit() {
    const sawoConfig = {
      // should be same as the id of the container
      containerID: 'sawo-container',
      // can be one of 'email' or 'phone_number_sms'
      identifierType: 'email',
      // Add the API key
      apiKey: '393c716b-d4ab-43ef-9c58-26717cd3193e',
      // Add a callback here to handle the payload sent by sdk
      onSuccess: (payload: any) => {
        console.log(`Payload: ${JSON.stringify(payload)}`);
        this.userPayload = payload;
        this.isLoggedIn = true;
      },
    };
    // creating instance
    this.Sawo = new Sawo(sawoConfig);
  }

  ngAfterViewInit() {
    this.Sawo.showForm();
  }
}
