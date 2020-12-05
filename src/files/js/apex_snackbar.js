var createSnackbar = (function() {
    var previous = null;
    
    return function(option) {
      if (previous) {
        previous.dismiss();
      }

      var snackbar = document.createElement('div');
      snackbar.style.backgroundColor = option.backgroundColor;
      snackbar.style.color = option.textColor;
      snackbar.className = 'apex-snackbar ' + option.position;
      snackbar.dismiss = function() {
        this.style.opacity = 0;
      };

      var text = document.createTextNode(option.message);
      snackbar.appendChild(text);

      if (option.actionText) {
        if (!option.action) {
          option.action = snackbar.dismiss.bind(snackbar);
        }

        var actionButton = document.createElement('button');
        actionButton.style.color = option.actionColor;
        actionButton.className = 'action';
        actionButton.innerHTML = option.actionText;
        actionButton.addEventListener('click', option.action);
        snackbar.appendChild(actionButton);
      }

      setTimeout(function() {
        if (previous === this) {
          previous.dismiss();
        }
      }.bind(snackbar), option.time);
      
      snackbar.addEventListener('transitionend', function(event, elapsed) {
        if (event.propertyName === 'opacity' && this.style.opacity == 0) {
          this.parentElement.removeChild(this);
          if (previous === this) {
            previous = null;
          }
        }
      }.bind(snackbar));
      
      previous = snackbar;
      document.body.appendChild(snackbar);

      getComputedStyle(snackbar).bottom;
      snackbar.style.bottom = '0px';
      snackbar.style.opacity = 1;
    };
  })();