# LWC Examples

## Smart + Dumb Component Pattern

```js
// smart container: ftClientDashboardContainer.js
import { LightningElement, wire } from "lwc";
import getDashboard from "@salesforce/apex/FT_ClientDashboardController.getDashboard";

export default class FtClientDashboardContainer extends LightningElement {
  state = { data: null, error: null };

  @wire(getDashboard)
  wiredDashboard({ data, error }) {
    if (data) this.state = { data, error: null };
    if (error) this.state = { data: null, error };
  }
}
```

```html
<!-- dumb presentational component: ftClientDashboardView.html -->
<template>
  <template lwc:if="{data}">
    <!-- render only -->
  </template>
  <template lwc:elseif="{error}">
    <c-error-panel message="Unable to load dashboard"></c-error-panel>
  </template>
  <template lwc:else>
    <lightning-spinner></lightning-spinner>
  </template>
</template>
```

## Jest Strategy Notes

- Test loading, success, empty, and error render states.
- Mock wire adapters and Apex modules.
- Assert emitted events and public contract behavior.
