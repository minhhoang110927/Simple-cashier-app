import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { environment } from 'src/environments/environment';
import { Item } from './item.model';

@Injectable({
  providedIn: 'root'
})
export class ItemService {
  formData: Item;
  list: Item[];

  constructor(private http:HttpClient) { }

  saveOrUpdateItem(){
    var body = {
      ...this.formData
    };
    return this.http.post(environment.apiURL + '/Item', body);
  }

  postItem(){
    var body = {
      ...this.formData
    };
    return this.http.post(environment.apiURL + '/Item', body);
  }

  putItem(){
    var body = {
      ...this.formData
    };
    return this.http.post(environment.apiURL+ '/Item' + this.formData, body);
  }

  deleteIt(id: number) {
    return this.http.delete(environment.apiURL + '/Item/'+id);
  }
  
  refreshList() {
    this.http.get(environment.apiURL+'/Item')
      .toPromise()
      .then(res =>this.list = res as Item[]);
  }

  getItemList(){
   return this.http.get(environment.apiURL+'/Item').toPromise();
  }

  getItemByID(id:number):any {
    return this.http.get(environment.apiURL + '/Item/'+id).toPromise();
  }

  deleteItem(id:number) {
    return this.http.delete(environment.apiURL + '/Item/'+id).toPromise();
  }
}
